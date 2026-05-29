#!/bin/bash

# Keymapp is not in any package manager — install manually from a downloaded release.
# Download the latest release from: https://www.zsa.io/keymapp

KEYMAPP_SRC="${1:-$HOME/Downloads/keymapp-latest}"

sudo cp "$KEYMAPP_SRC/keymapp" /usr/local/bin/keymapp
sudo chmod 755 /usr/local/bin/keymapp

sudo cp "$KEYMAPP_SRC/icon.png" /usr/share/pixmaps/keymapp.png

sudo tee /usr/share/applications/keymapp.desktop > /dev/null << 'EOF'
[Desktop Entry]
Name=Keymapp
Exec=/usr/local/bin/keymapp
Icon=keymapp
Type=Application
Categories=Utility;
EOF

sudo update-desktop-database /usr/share/applications/
