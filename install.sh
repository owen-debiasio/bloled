#!/bin/bash

set -e

clear

echo -e "bloled will now install.\nPress enter to continue...\n"
read

echo "Copying files..."
cp -r blooled $HOME/.local/share/zed/extensions/installed/

echo "Done!"
