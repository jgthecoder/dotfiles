#!/usr/bin/env bash

# Variables
NOTES_DIR="$HOME/Notes"
GIT_REPO="git@github.com:jg-the-coder/notes.git"

# Navigate to notes directory
cd "$NOTES_DIR" || exit

# Initialize Git if not already
if [ ! -d ".git" ]; then
  git init
  git remote add origin "$GIT_REPO"
  git fetch
  git checkout -b main
fi

# Commit and push changes
git add .
git commit -m "Auto-sync notes on $(date +"%Y-%m-%d %H:%M:%S")"
git push origin main

echo "Notes synced to remote repository."
