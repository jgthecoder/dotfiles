#!/usr/bin/env bash

BACKUP_DIR="$HOME/dotfile-backups"
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
ARCHIVE="$BACKUP_DIR/dotfiles_$TIMESTAMP.tar.gz"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# List of dotfiles to back up
DOTFILES="zshrc tmux.conf gitconfig"

# Create archive
tar -czvf "$ARCHIVE" -C $HOME/dotfiles $DOTFILES

echo "Backup created: $ARCHIVE"
