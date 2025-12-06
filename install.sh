#!/bin/bash
set -euo pipefail

# Color codes
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
CYAN="\033[1;36m"
RED="\033[1;31m"
RESET="\033[0m"

clear
echo -e "${CYAN}========================================${RESET}"
echo -e "${CYAN}          Installing bloled...          ${RESET}"
echo -e "${CYAN}========================================${RESET}\n"

# Pause for user input
if [ -t 0 ]; then
    read -rp "${YELLOW}Press Enter to continue...${RESET}" 
else
    read -r < /dev/tty
fi

REPO_URL="https://github.com/owen-debiasio/bloled.git"
DEST="$HOME/.local/share/zed/extensions/installed/bloled"
TMP_DIR="$(mktemp -d)"

echo -e "${CYAN}Cloning repository...${RESET}"
git clone --depth=1 "$REPO_URL" "$TMP_DIR"

echo -e "${CYAN}Copying files...${RESET}"

if [ -d "$DEST" ]; then
    rm -rf "$DEST"
    echo -e "${YELLOW}Removed previous install.${RESET}"
else
    echo -e "${YELLOW}Theme isn't already installed, skipping removal.${RESET}"
fi

mkdir -p "$(dirname "$DEST")"
cp -r "$TMP_DIR/bloled" "$DEST"

echo -e "${CYAN}Cleaning up...${RESET}"
rm -rf "$TMP_DIR"

echo -e "${GREEN}Installation complete!${RESET}"
echo -e "${CYAN}========================================${RESET}"
