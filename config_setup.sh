#!/usr/bin/env bash

# Set up tmux config
mkdir -p ~/.config/tmux
ln -s $(pwd)/tmux/tmux.conf ~/.config/tmux/tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Run <prefix> + I to install Tmux plugins"

ln -s $(pwd)/helix ~/.config/helix

ln -s $(pwd)/vimrc ~/.vimrc

ln -s $(pwd)/alacritty ~/.config/alacritty
