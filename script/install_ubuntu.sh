#!/bin/bash

UBUNTU_VERSION=$(lsb_release -d | cut -f2 | cut -d' ' -f2)
UBUNTU_VERSION="${UBUNTU_VERSION:0:5}"
if [[ "${UBUNTU_VERSION}" == "17.04" ]]; then
	echo "Migration from Zesty (17.04) to Bionic (18.04)"
	sudo sed -i 's/zesty/bionic/g' /etc/apt/sources.list
	sudo apt purge 'nvidia.*'
	sudo apt-add-repository ppa:graphics-drivers/ppa
	sudo apt update
	sudo apt install nvidia-384 nvidia-prime intel-microcode
fi

# System diagnostic tool
sudo add-apt-repository -y ppa:oguzhaninan/stacer

# Signal
curl -s https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

sudo apt update && sudo apt upgrade -y

sudo apt install -y vim git curl wget cmake libbox2d-dev gcc-7 g++-7 libbluetooth-dev build-essential libglu1-mesa-dev libgtkmm-3.0-dev libusb-1.0-0-dev clang-format libirrlicht-dev gcc-7-arm-linux-gnueabihf g++-7-arm-linux-gnueabihf net-tools dnsmasq-base i3-wm firefox thunderbird dia nitrogen pulseaudio pandoc rofi pavucontrol numlockx virt-manager qemu vde2 ebtables bridge-utils netcat vlc qtwayland5 inkscape unity-tweak-tool stacer calibre i3lock i3lock-fancy meson pkg-config libgtk-3-dev libgtksourceview-3.0-dev libwebkit2gtk-4.0-dev libgtkspell3-3-dev wireshark signal-desktop compton xcompmgr gdb-multiarch gcc-arm-none-eabi openocd libdvdnav4 libdvdread4 gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly libdvd-pkg python3-pip gparted astyle fonts-powerline

sudo service libvirtd start

if [ ! -d "~/.rustup" ]; then
	curl https://sh.rustup.rs -sSf | sh
	cargo install mdbook
	rustup component add rustfmt-preview
    rustup target add thumbv7m-none-eabi
fi

sudo wget https://cht.sh/:cht.sh -O /usr/local/bin/cht.sh
sudo chmod o+x /usr/local/bin/cht.sh

cd /tmp
git clone https://github.com/fabiocolacio/Marker.git
cd Marker
git submodule update --init --recursive
mkdir build && cd build
meson .. --prefix /usr/local
ninja
sudo ninja install

cd /tmp
git clone https://github.com/haikarainen/light.git
cd light
./autogen.sh && ./configure && make
sudo make install

pip3 install --user pipenv
