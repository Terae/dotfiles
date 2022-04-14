#!/bin/bash
home="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

source "$home"/script/installer.sh

print_information "Installation of i3"

install_if_needed i3-wm
install_if_needed i3
install_if_needed compton
install_if_needed rofi
#install_if_needed fonts-powerline
#install_if_needed powerline

info "Installation of i3 config files"
mkdir -p ~/.config/i3
cd ~/.config/i3

cp "$home"/i3/config .

mkdir ~/.config/i3status-rust
cd ~/.config/i3status-rust
cp "$home"/i3/config.toml .

cd /tmp
git clone https://github.com/meskarune/i3lock-fancy.git
cd i3lock-fancy
sudo make install

# Rust setup
#which cargo > /dev/null
#if [ "$1" != 0 ]; then
#	curl https://sh.rustup.rs -sSf | sh
#fi

#git clone https://github.com/XYunknown/i3status-rust.git
#cd i3status-rust && cargo build --release
#cp "$home"/i3/config.toml ~/.config/i3/i3status-rust/config.toml

#sudo usermod -a -G video "$(id -u -n)"
#sudo cp backlight.rules /etc/udev/rules.d/

i3 reload

