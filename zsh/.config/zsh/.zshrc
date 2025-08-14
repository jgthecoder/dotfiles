#!/usr/bin/env zsh

# Author: jgthecoder <jgthecoder@gmail.com>
# Date: July 2025

setopt interactive_comments
setopt autocd

source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -U promptinit; promptinit
prompt pure

export TERM="tmux-256color"

# zstyle ":completion:*" list-colors "${(s.:.)LS_COLORS}"

if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh --cmd cd)"
fi

# fzf setup (basic)
if [ -f "$HOME/.fzf.zsh" ]; then
    source "$HOME/.fzf.zsh"
fi

# Bat over cat
if command -v bat >/dev/null 2>&1; then
    alias cat='bat -pn'
fi

if command -v fzf >/dev/null; then
    # optional: only source if fzf exists
    source <(fzf --zsh)
    bindkey "ç" fzf-cd-widget
    # Preview file content using bat (https://github.com/sharkdp/bat)
    export FZF_CTRL_T_OPTS="
    --walker-skip .git,node_modules,target
    --preview 'bat -n --color=always {}'
    --bind 'ctrl-/:change-preview-window(down|hidden|)'"
fi


export HISTSIZE=110000
export SAVEHIST=100000
export HISTFILE="$ZDOTDIR/history"
export HISTTIMEFORMAT="%F %T"

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt extended_glob null_glob

bindkey "^p" history-search-backward
bindkey "^n" history-search-forward

# Aliases
alias ls="ls --color=always"
alias l="ls -lah"
alias grep="grep --color=always"
alias diff="diff --color=always"
alias c="clear"
alias mv="mv -i"
alias cp="cp -i"
alias rm="trash"

alias ga="git add -A"
alias gc="git commit -m"
alias gs="git status -s"

# function source_if_exists () {
#   [ -f "$1" ] && source "$1"
# }
#
# source_if_exists "$HOME/.profile"
#
# # for file in aliases.sh functions.sh history.sh extras.sh prompt.sh local.sh; do
# #   source_if_exists "$ZDOTDIR/$file"
# # done
#
# # The following lines have been added by Docker Desktop to enable Docker CLI completions.
# fpath=(/Users/Joshua/.docker/completions $fpath)
# autoload -Uz compinit
# compinit
# # End of Docker CLI completions
#
# export NVM_DIR="$HOME/.config/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# pnpm
export PNPM_HOME="/Users/Joshua/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export PATH="$PATH:$HOME/.local/bin/"
. "$HOME/.cargo/env"

[ -f "$ZDOTDIR/aliases.sh" ] && source "$ZDOTDIR/aliases.sh"
[ -f "$ZDOTDIR/functions.sh" ] && source "$ZDOTDIR/functions.sh"

for file in $XDG_CONFIG_HOME/shellconfig/*;
do
    source $file
done

