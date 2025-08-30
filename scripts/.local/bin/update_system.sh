#!/bin/sh

# Update Homebrew packages
if command -v brew > /dev/null; then
  brew update
  brew upgrade
  brew cleanup
fi

# Update macOS software
sudo softwareupdate -i -a
