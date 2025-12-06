#!/bin/bash
set -euo pipefail

echo "bloled will now be uninstalled. Press Enter to continue..."

if [ -t 0 ]; then
    read -r
else
    read -r < /dev/tty
fi

DEST="$HOME/.local/share/zed/extensions/installed/bloled"

if [ -d "$DEST" ]; then
    rm -rf "$DEST"
    echo "Uninstalled."
else
    echo "bloled isn't installed. No need to do anything."
fi

echo "Done!"
