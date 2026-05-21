#!/bin/bash

is_stow_installed() {
  command -v stow &> /dev/null
}

install_tpm() {
  local tpm_path="${XDG_DATA_HOME:-$HOME/.local/share}/tmux/plugins/tpm"
  if [ ! -d "$tpm_path" ]; then
    echo "Installing TPM..."
    git clone https://github.com/tmux-plugins/tpm "$tpm_path"
  else
    echo "TPM already installed, skipping"
  fi
}

if ! is_stow_installed; then
  echo "Install stow first"
  exit 1
fi

install_tpm

echo "Removing old configs"
rm -rf \
  ~/.config/ack \
  ~/.config/aerospace \
  ~/.config/borders \
  ~/.config/git \
  ~/.config/nvim \
  ~/.config/starship.toml \
  ~/.config/tmux \
  ~/.config/tmuxinator \
  ~/.config/zsh \
  ~/.config/ghostty

stow ack
stow aerospace
stow jankyborders
stow git
stow nvim
stow ghostty
stow starship
stow tmux
stow tmuxinator
stow zsh

echo "Dotfiles configured"
