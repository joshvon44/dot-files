#!/usr/bin/env bash

FONT_NAME="JetBrainsMono"

fc-list : family | grep $FONT_NAME >/dev/null

if [ $? -eq 0 ]; then
    echo "Font already installed"
    exit 0
fi

# Install the font
echo "Missing JetBrains Mono Nerd font"
echo "Installing ..."
# Make sure the directory exists, download and extra the data
mkdir -p ~/.local/share/fonts
curl -L https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz 2>/dev/null \
    | tar -xJ -C ~/.local/share/fonts
# Make sure font is cached
fc-cache -f -v >/dev/null 2>&1

fc-list : family | grep $FONT_NAME >/dev/null
if [ $? -ne 0 ]; then
    echo "Error installing JetBrains Mono Nerd font"
    exit 1
fi

echo "Font successfully installed"
exit 0
