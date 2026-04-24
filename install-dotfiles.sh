#!/bin/bash

is_stow_installed() {
  pacman -Qi "stow" &> /dev/null
}

if ! is_stow_installed; then
  echo "Install stow first"
  exit 1
fi

echo "Removing old configs"
rm -rf \
  ~/.config/ack \
  ~/.config/git \
  ~/.config/nvim \
  ~/.config/tmux \
  ~/.config/tmuxinator \
  ~/.config/zsh \
  ~/.config/ghostty

stow ack
stow git
stow nvim
stow ghostty
stow tmux
stow tmuxinator
stow zsh

echo "Dotfiles configured"
