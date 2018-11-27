#!/bin/bash

### See cpc.cx/jQ3

# Install graphic drivers
#sudo apt purge 'nvidia.*'
#sudo apt-add-repository ppa:graphics-drivers/ppa
#sudo apt update
#sudo apt install nvidia-381 nvidia-prime intel-microcode

# Auto-mount storage partition
#sudo apt-get install ntfs-3g
#sudo mkdir /media/storage
#sudo cp /etc/fstab /etc/fstab.backup
#sudo blkid
echo "Copier l'UUID de /dev/sdb1"
echo "Ecrire 'sudo vim /etc/fstab'"
echo "rajouter la ligne 'UUID=???????????? /media/storage/ ntfs-3g auto,user,rw,exec 0 0"

p=/media/storage/terae

sudo apt-get update
sudo apt-get upgrade
sudo apt install zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

cd /tmp
git clone https://github.com/meskarune/i3lock-fancy.git
cd i3lock-fancy
sudo make install

sudo apt install thunderbird firefox atom cmake dia git nitrogen pulseaudio pandoc vim rofi curl pavucontrol numlockx ruby ocaml box2d libirrlicht-dev clang opam
sudo ln -s $p/Downloads/Linux/IDEs/clion-2018.2.3/bin/clion.sh /usr/local/bin/clion
sudo ln -s $p/Downloads/Linux/IDEs/idea-IU-172.3968.16/bin/idea.sh /usr/local/bin/idea
