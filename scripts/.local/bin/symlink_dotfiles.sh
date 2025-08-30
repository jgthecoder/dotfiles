#!/bin/sh

# Variables
DOTFILES_DIR="$HOME/dotfiles"

# List of dotfiles to symlink
# DOTFILES="zshrc tmux.conf gitconfig"
DOTFILES="zshrc"

# Create symlinks
for file in $DOTFILES; do
  if [ -f "$DOTFILES_DIR/$file" ]; then
    ln -sf "$DOTFILES_DIR/$file" "$HOME/.$file"
    echo "Symlinked $file"
  else
    echo "File $file not found in $DOTFILES_DIR"
  fi
done
