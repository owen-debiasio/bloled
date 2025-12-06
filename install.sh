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

REPO="https://github.com/owen-debiasio/bloled.git"
TMP_DIR="$(mktemp -d)"
DEST="$HOME/.local/share/zed/extensions/installed/bloled"

echo "Cloning repo..."
git clone --depth=1 "$REPO" "$TMP_DIR"

echo "Installing files..."
if [ -d "$DEST" ]; then
    rm -rf "$DEST"
    echo "Removed previous install."
fi

mkdir -p "$HOME/.local/share/zed/extensions/installed/"
cp -r "$TMP_DIR/bloled" "$DEST"

echo "Cleaning up..."
rm -rf "$TMP_DIR"

echo "Done!"
