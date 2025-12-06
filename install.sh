#!/bin/bash
set -euo pipefail

clear
echo -e "bloled will now install.\nPress Enter to continue...\n"

# Make the pause work even with curl | bash
if [ -t 0 ]; then
    read -r
else
    read -r < /dev/tty
fi

REPO_URL="https://github.com/owen-debiasio/bloled.git"
DEST="$HOME/.local/share/zed/extensions/installed/bloled"
TMP_DIR="$(mktemp -d)"

echo "Cloning repo..."
git clone --depth=1 "$REPO_URL" "$TMP_DIR"

echo "Copying files..."

# Remove old install
if [ -d "$DEST" ]; then
    rm -rf "$DEST"
    echo "Removed previous install."
else
    echo "Command isn't already installed, skipping"
fi

# Ensure parent dir exists
mkdir -p "$HOME/.local/share/zed/extensions/installed/"

# Copy the actual extension folder from the repo
cp -r "$TMP_DIR/bloled" "$DEST"

echo "Cleaning up..."
rm -rf "$TMP_DIR"

echo "Done!"
