#!/bin/sh

CONFIG_DIR="$HOME/.config"
DOTFILES_DIR="$HOME/dotfiles"
DOTFILES_CONFIG_DIR="$DOTFILES_DIR/.config"

function install_dotfiles() {
    stow $DOTFILES_CONFIG_DIR --target="$CONFIG_DIR"
    stow $DOTFILES_DIR
}

if command -v stow &>/dev/null; then
    install_dotfiles
else
    echo "Command not found"
fi


