#!/bin/bash

# Define the source and destination directories.
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/skills/mnemoteca"
DEST_DIR="$HOME/.claude/skills/mnemoteca"

echo "Installing Claude Code Mnemoteca Skill..."

# Check if source directory exists.
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Could not find skill directory at $SOURCE_DIR"
    exit 1
fi

# Create the destination directory if it does not exist.
mkdir -p "$HOME/.claude/skills"

# Copy the files.
echo "Copying files to $DEST_DIR..."
rm -rf "$DEST_DIR" # Remove existing Mnemoteca installation if any.
cp -r "$SOURCE_DIR" "$DEST_DIR"

echo "Installation complete!"
echo "Please restart any active Claude Code sessions to load the skill."
