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
echo -e "${CYAN}          Uninstalling bloled...        ${RESET}"
echo -e "${CYAN}========================================${RESET}\n"

# Pause for user input
if [ -t 0 ]; then
    read -rp "${YELLOW}Press Enter to continue...${RESET}" 
else
    read -r < /dev/tty
fi

DEST="$HOME/.local/share/zed/extensions/installed/bloled"

if [ -d "$DEST" ]; then
    rm -rf "$DEST"
    echo -e "${YELLOW}bloled uninstalled.${RESET}"
else
    echo -e "${YELLOW}bloled isn't installed. Nothing to do.${RESET}"
fi

echo -e "${GREEN}Done!${RESET}"
echo -e "${CYAN}========================================${RESET}"
