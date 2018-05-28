#!/bin/bash
home="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$home"/script/installer.sh

print_information "Installation of GIT"

install_if_needed git

cp "$home"/git/gitconfig ~/.gitconfig

