#!/bin/sh

# Variables
BREWFILE="$HOME/dotfiles/Brewfile"

# Check if Homebrew is installed
if ! command -v brew > /dev/null; then
  echo "Homebrew not found. Installing..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install packages from Brewfile
if [ -f "$BREWFILE" ]; then
  brew bundle --file="$BREWFILE"
else
  echo "Brewfile not found at $BREWFILE"
fi
