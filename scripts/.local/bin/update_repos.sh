#!/bin/sh

# Variables
PROJECTS_DIR="$HOME/Projects"

# Navigate to projects directory
cd "$PROJECTS_DIR" || exit

# Update all Git repositories
for dir in */; do
  if [ -d "$dir/.git" ]; then
    echo "Updating $dir..."
    cd "$dir" || continue
    git pull
    cd ..
  fi
done
