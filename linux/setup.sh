#!/bin/bash

# Update and upgrade apt
sudo apt update && sudo apt upgrade -y

# Install binaries via apt
source linux/apt.sh

# Install zsh
source install-zsh.sh

# Create symlinks for dotfiles
source link-dotfiles.sh
