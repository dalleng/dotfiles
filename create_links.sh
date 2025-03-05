#!/bin/bash
# IMPORTANT: This script should be run from the dotfiles folder

# Enable command logging to stdout
# set -x

# Create symbolic links for dotfiles
ln -s $(pwd)/.zshrc $HOME/.zshrc
ln -s $(pwd)/starship.toml $HOME/.config/starship.toml
ln -s $(pwd)/config.lua $HOME/.config/lvim/config.lua
ln -s $(pwd)/tmux.conf $HOME/.tmux.conf
ln -s $(pwd)/config $HOME/Library/Application\ Support/com.mitchellh.ghostty/config 
