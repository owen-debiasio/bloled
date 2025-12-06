#!/bin/bash

set -e

clear

echo -e "bloled will now install.\nPress enter to continue...\n"
read

DEST="$HOME/.local/share/zed/extensions/installed/bloled"

echo "Copying files..."

if [ -d "$DEST" ]; then
    rm -rf "$DEST"
    echo "Removed old version."
else
    echo "No previous install found, skipping removal."
fi
mkdir -p "$HOME/.local/share/zed/extensions/installed/"

# Copy the folder next to the script
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cp -r "$SCRIPT_DIR/bloled" "$HOME/.local/share/zed/extensions/installed/"

echo "Done!"
