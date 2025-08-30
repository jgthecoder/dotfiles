#!/bin/sh

# Variables
DOWNLOADS_DIR="$HOME/Downloads"
ARCHIVES_DIR="$HOME/Archive"
DAYS_OLD=30

# Create archives directory if it doesn't exist
mkdir -p "$ARCHIVES_DIR"

# Move old files
find "$DOWNLOADS_DIR" -type f -mtime +$DAYS_OLD -exec mv {} "$ARCHIVES_DIR" \;

echo "Moved files older than $DAYS_OLD days to $ARCHIVES_DIR"
