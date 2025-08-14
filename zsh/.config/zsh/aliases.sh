# Aliases for dev tools
alias l='ls -CF'
alias ll='ls -l'
alias la='ls -lathr'

alias ..='cd ..'
alias ...='cd ../..'
alias -- -='cd -'

alias c='clear'
alias v='nvim'
alias g='git'
alias py='python3'
alias mk='make'
alias serve='python3 -m http.server'
alias termclock='tty-clock -c -C 4 -S'

# Git helpers
alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'

# Aliases
# alias l="eza -lahF --icons --git"
alias grep="grep --color=auto"
alias zrc="$EDITOR $ZDOTDIR/.zshrc"
alias c="clear"
alias rm="trash -v"
alias mkdir="mkdir -p"
alias cat="bat -n"
alias neovim="NVIM_APPNAME=NeoVim nvim"

alias cp="cp -i"
alias mv="mv -i"
alias ps="ps auxf"
alias less="less -R"
alias ping="ping -c 10"
alias da="date '+%Y-%m-%d %A %T %Z'"

alias home="cd ~"
alias cd..="cd .."
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias gs="git status -sb"
alias gaa="git add -A"


alias ls="ls -aFh --color=always" # add colors and file type extensions
alias la="ls -Alh" # show hidden files
alias lx="ls -lXBh" # sort by extension
alias lk="ls -lSrh" # sort by size

alias lc="ls -ltcrh" # sort by change time
alias lu="ls -lturh" # sort by access time
alias lr="ls -1Rh" # recursive ls
alias lt="ls -ltrh" # sort by date
alias lm="ls -alh | more" # pipe through 'more'
alias lw="ls -xAh" # wide listing format
alias ll="ls -Fls" # long listing format
alias labc="ls -lap" # alphabetical sort
alias lf="1s -1 | egrep -v '^d'" # files only
alias ldir="ls -l | egrep '^d'" # directories only
alias lla="ls -Al" # List and Hidden Files
alias las="ls -A" # Hidden Files
alias lls="ls -l" # List

alias mx="chmod a+x"
alias 000="chmod -R 000"
alias 644="chmod -R 644"
alias 666="chmod -R 666"
alias 755="chmod -R 755"
alias 777="chmod -R 777"

alias h="history | grep"

# Search running processes
alias p="ps aux | grep"

# search files in the current folder
alias f="find . | grep"

# Check the type of a command
alias checkcommand="type -t"

# Safe and forced reboots
alias rebootsafe='sudo shutdown -r now'
alias rebootforce='sudo shutdown -r -n now'

# Disk space and folder size info
alias diskspace='du -S | sort -n -r | more'
alias folders='du -h --max-depth=1'
alias folderssort='find . -maxdepth 1 -type d -print0 | xargs -0 du -sk | sort -rn'
alias tree='tree -CAhF --dirsfirst'
alias treed='tree -CAFd'
alias mountedinfo='df -hT'

# Archives
alias mktar='tar -cvf'
alias mkbz2='tar -cyjf'
alias mkgz='tar -cvzf'
alias untar='tar -xvf'
alias unbz2='tar -xvjf'
alias ungz='tar -xvzf'

