#!/usr/bin/env zsh

# ===============================
# Zsh Helper Functions
# Source this file in .zshrc
# ===============================

unalias gs 2>/dev/null
unalias gac 2>/dev/null
unalias gp 2>/dev/null
unalias gpl 2>/dev/null
unalias gl 2>/dev/null
unalias serve 2> /dev/null
unalias lc 2> /dev/null

# ---- Navigation ----

# Create and enter a directory
take() { mkdir "$1" && cd "$1"; }

# Go up N directories (default=1)
up() { cd $(printf '../%.0s' $(seq 1 ${1:-1})); }

# Quick jump back to previous directory
back() { cd "$OLDPWD"; }

# Find file by name (case-insensitive)
ff() { find . -iname "*$**"; }


# ---- File Management ----

# Extract archives by extension
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2) tar xjf "$1" ;;
      *.tar.gz)  tar xzf "$1" ;;
      *.tar.xz)  tar xJf "$1" ;;
      *.bz2)     bunzip2 "$1" ;;
      *.rar)     unrar x "$1" ;;
      *.gz)      gunzip "$1" ;;
      *.tar)     tar xf "$1" ;;
      *.tbz2)    tar xjf "$1" ;;
      *.tgz)     tar xzf "$1" ;;
      *.zip)     unzip "$1" ;;
      *.Z)       uncompress "$1" ;;
      *.7z)      7z x "$1" ;;
      *)         echo "'$1' cannot be extracted" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Safer remove: move files to ~/.trash instead
trash() { mkdir -p ~/.trash && mv "$@" ~/.trash/; }

# Clean up empty directories
cleanempty() { find . -type d -empty -delete; }

# Show largest files in directory
biggest() { du -ah . | sort -rh | head -n ${1:-20}; }


# ---- Logging / Output ----

# Timestamped log
log() { echo "[$(date +'%Y-%m-%d %H:%M:%S')] $*"; }

# Colored messages
info()    { print -P "%F{cyan}[INFO]%f $*"; }
warn()    { print -P "%F{yellow}[WARN]%f $*"; }
error()   { print -P "%F{red}[ERROR]%f $*"; }
success() { print -P "%F{green}[OK]%f $*"; }


# ---- Productivity ----

# Search command history
hgrep() { history | grep "$*"; }

# Reload Zsh config
reload() { source "$ZDOTDIR/.zshrc" && success "Reloaded .zshrc"; }

# Stopwatch timer for a command
timer() { start=$(date +%s); "$@"; end=$(date +%s); echo "Took $((end-start))s"; }

# Repeat a command every N seconds
repeatcmd() {
  if [ $# -lt 2 ]; then
    echo "Usage: repeatcmd <seconds> <command> [args...]"
    return 1
  fi
  interval=$1
  shift
  while true; do
    "$@"
    sleep "$interval"
  done
}

# Quick notes (append to ~/notes.txt)
note() { echo "[$(date +'%F %T')] $*" >> ~/notes.txt; success "Note saved"; }

# ---- Git Helpers ----

gs()  { git status -sb; }
gac() { git add . && git commit -m "$*"; }
gp()  { git push origin "$(git rev-parse --abbrev-ref HEAD)"; }
gpl() { git pull origin "$(git rev-parse --abbrev-ref HEAD)"; }
gl()  { git log --oneline --graph --decorate -n ${1:-20}; }

# ---- Network / System ----

# Simple local server
serve() { python3 -m http.server "${1:-8000}"; }

# Show public IP
myip() { curl -s https://ipinfo.io/ip; }

# Disk usage sorted
dusort() { du -sh * | sort -h; }

# CPU usage top 10
topcpu() { ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -n 11; }

# Memory usage top 10
topmem() { ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -n 11; }


# ---- Text Helpers ----

# Count lines/words/chars in a file
lc() { wc "$1"; }

# Convert to lowercase
lower() { echo "$@" | tr '[:upper:]' '[:lower:]'; }

# Convert to uppercase
upper() { echo "$@" | tr '[:lower:]' '[:upper:]'; }

# Replace text in files
replace() { sed -i "s/$1/$2/g" "$3"; }

# Preview markdown as plain text
mdcat() { pandoc "$1" -t plain | less; }
