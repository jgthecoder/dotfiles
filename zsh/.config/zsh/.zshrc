#!/usr/bin/env zsh

# Author: jgthecoder <jgthecoder@gmail.com>
# Date: July 2025

function source_if_exists () {
  [ -f "$1" ] && source "$1"
}

for file in prompt.zsh vars.zsh options.zsh aliases.zsh functions.zsh extras.zsh helpers.zsh; do
  source_if_exists "$ZDOTDIR/$file"
done
