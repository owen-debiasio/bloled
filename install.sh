#!/bin/bash

set -e

clear

echo -e "bloled will now install.\nPress enter to continue...\n"
read

echo "Copying files..."
rm -rf $HOME/.local/share/zed/extensions/installed/bloled/ | echo "Command isn't already installed, skipping"
cp -r bloled $HOME/.local/share/zed/extensions/installed/

echo "Done!"
