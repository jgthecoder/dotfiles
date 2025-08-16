#!/usr/bin/env zsh

# -- History
export HISTSIZE=110000
export SAVEHIST=100000
export HISTFILE="$ZDOTDIR/history"
export HISTTIMEFORMAT="%F %T"

# -- Tmux --
export TERM="tmux-256color"

export EDITOR=nvim
export VISUAL=$EDITOR

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# -- Path --
export PATH="$PATH:$HOME/.local/bin/"
