#!/bin/sh

SCRIPT_DIR="$HOME/dotfiles/scripts"  # Replace with the directory where your scripts are stored
TARGET_DIR="$HOME/.local/bin"

# Copy scripts to ~/.local/bin
cp "$SCRIPT_DIR"/* "$TARGET_DIR/"

# Make scripts executable
chmod +x "$TARGET_DIR"/*

echo "Scripts synced to $TARGET_DIR"
