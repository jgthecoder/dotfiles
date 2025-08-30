#!/bin/sh

# Variables
TARGET_DIR="$HOME"
SIZE="+100M"

# Find and delete large files
find "$TARGET_DIR" -type f -size "$SIZE" -exec rm -f {} \;

echo "Deleted files larger than $SIZE in $TARGET_DIR"
