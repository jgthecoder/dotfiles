# -------------------------------------------------------------------------------------------------------------
#
#      ██╗ ██████╗ ███████╗██╗  ██╗██╗   ██╗ █████╗      ██████╗ ██╗   ██╗███████╗███╗   ███╗ █████╗ ███╗   ██╗
#      ██║██╔═══██╗██╔════╝██║  ██║██║   ██║██╔══██╗    ██╔════╝ ██║   ██║╚══███╔╝████╗ ████║██╔══██╗████╗  ██║
#      ██║██║   ██║███████╗███████║██║   ██║███████║    ██║  ███╗██║   ██║  ███╔╝ ██╔████╔██║███████║██╔██╗ ██║
# ██   ██║██║   ██║╚════██║██╔══██║██║   ██║██╔══██║    ██║   ██║██║   ██║ ███╔╝  ██║╚██╔╝██║██╔══██║██║╚██╗██║
# ╚█████╔╝╚██████╔╝███████║██║  ██║╚██████╔╝██║  ██║    ╚██████╔╝╚██████╔╝███████╗██║ ╚═╝ ██║██║  ██║██║ ╚████║
#  ╚════╝  ╚═════╝ ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝     ╚═════╝  ╚═════╝ ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝
#
# -------------------------------------------------------------------------------------------------------------
#                                              Z-Shell Aliases
# -------------------------------------------------------------------------------------------------------------

# echo "This line was executed successfully"

# Copied from https://www.greasyguide.com/linux/configure-use-aliases-zsh/

# Basic Aliases ::
#alias [name]="[command]"

# Shorter clear command
alias c="clear"

alias s="source ~/.zshrc"

# Confirm before overwriting and verbose output
alias cp="cp -iv"
alias mv="mv -iv" 

# Always use color output and human-readable sizes
alias dir="dir --color=auto"
alias vdir="vdir --color=auto"
alias grep="grep --color=auto"
alias fgrep="fgrep --color=auto"
alias egrep="egrep --color=auto"

# Ping 5 times only
alias ping="ping -c 5"

# Quick system update 
alias update_packages="brew update; brew upgrade; brew upgrade --cask; brew cleanup"

alias spacer="defaults write com.apple.dock persistent-apps -array-add '{'tile-type'='spacer-tile';}'; killall Dock"
alias termclock="tty-clock -c -C 4 -S -t"
alias screensaver="cmatrix -ba -u 2 -C blue"
alias pyvenv="python3 -m venv .venv && pip3 install --upgrade pip"

# GIT
alias g="git status"
alias gs="git status"
alias ga="git add"
alias gd="git diff"
alias gb="git branch"
alias gm="git checkout master"
alias gc="git commit -m $1"
alias gp="git push"
alias grao="git remote add origin"
alias gpom="git push -u origin master"
alias gdog="git log --all --decorate --oneline --graph"

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -iv'
alias la='ls -alh'

alias ls='eza --icons --color'
alias l="ls -lahF"
alias n="nvim"
alias cat=bat

alias ..="cd .."
alias dev="cd $HOME/Developer/MyProject"
alias ta="tmux attach"
alias dots="cd $HOME/dotfiles"

# git aliases
alias gs='git status'
alias gp='git pull'
alias gb='git branch'
alias ga='git add'
alias gc='git commit -m $1'

# Suffix Aliases ::
# alias -s [language]="tool"

# Open text files in Vim
alias -s txt="nvim"

# Open HTML files in Firefox Developer Edition
alias -s html="firefox-developer-edition"

# Open PDFs in Okular
alias -s pdf="okular"

# Open JPG and PNG in Gwenview
alias -s {jpg,png}="gwenview"

# Open C and C++ files in VS Code
alias -s {c,cpp}="code"

# Global Aliases
# Pipe output to less pager
alias -g L="| less"

# Pipe output to xclip to copy to clipboard
alias -g X="| xclip -selection c"

# Append output to file  
alias -g T="| tee -a" 

# Grep with line numbers and case-insensitive
alias -g G="| grep -ni"

# Parameterized Aliases ::
# Make directory and enter it
md() { 
    mkdir -p $1
    cd $1
}

# Find file containing pattern 
ff() {
    find . -type f -iname "*$1*"
}

# Create archive of specified directory
compress() {
    tar czvf $1.tar.gz $1
}

get_ip() {
    external_ip=$(curl -s ifconfig.me)
    internal_ip=$(ifconfig | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}')

    echo "External IP: $external_ip"
    echo "Internal IP: $internal_ip"
}

function mkcd() {
    mkdir -p "$1" && cd "$1"
}

function weather() {
    curl "wttr.in/$1"
}

function se() {
  choice="$(find ~/.local/bin -mindepth 1 -print | fzf)"
  [ -f "$choice" ] && $EDITOR "$choice"
}

function fuzzy_tmux_window() {
  tmux-sessionizer
  zle reset-prompt
}

zle -N fuzzy_tmux_window
bindkey '^F' fuzzy_tmux_window


