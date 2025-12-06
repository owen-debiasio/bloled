#!/bin/bash
set -euo pipefail

clear
echo -e "bloled will now install.\nPress Enter to continue...\n"

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

if [ -d "$DEST" ]; then
    rm -rf "$DEST"
    echo "Removed previous install."
else
    echo "Theme isn't already installed, skipping"
fi

mkdir -p "$HOME/.local/share/zed/extensions/installed/"
cp -r "$TMP_DIR/bloled" "$DEST"

echo "Cleaning up..."
rm -rf "$TMP_DIR"

echo "Done!"
