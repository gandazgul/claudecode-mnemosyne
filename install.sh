#!/bin/bash

# Define the source and destination directories
SOURCE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/skills/mnemosyne"
DEST_DIR="$HOME/.claude/skills/mnemosyne"

echo "Installing Claude Code Mnemosyne Skill..."

# Check if source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Could not find skill directory at $SOURCE_DIR"
    exit 1
fi

# Create the destination directory if it doesn't exist
mkdir -p "$HOME/.claude/skills"

# Copy the files
echo "Copying files to $DEST_DIR..."
rm -rf "$DEST_DIR" # Remove existing installation if any
cp -r "$SOURCE_DIR" "$DEST_DIR"

echo "Installation complete!"
echo "Please restart any active Claude Code sessions to load the skill."
