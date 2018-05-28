#!/bin/bash
home="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$home"/script/installer.sh

print_information "Installation of ZSH"

install_if_needed curl
install_if_needed git
install_if_needed zsh

info "Installation of Oh-my-zsh"
curl -L http://install.ohmyz.sh | sh

cp "$home"/zsh/zsh_aliases ~/.zsh_aliases
cp "$home"/zsh/zshrc ~/.zshrc

