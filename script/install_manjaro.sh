cd
#sudo su
#echo "UUID=0A440A98440A86A3                     /media/storage ntfs-3g auto,user,rw,exec          0 0" >> /etc/fstab
#echo "/swapfile                                 none           swap    defaults                   0 0" >> /etc/fstab
#exit

sudo pacman -S zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

rm -r .antigen .bash* .zsh* Documents .gitconfig .i3 Music Pictures Programs .ssh Videos .vimrc .xinputrc .Xresources .zshrc
p=/media/storage/terae
ln -s $p/.antigen $p/.atom $p/.bash* $p/Documents $p/.gitconfig $p/.i3 $p/Music $p/Pictures $p/Programs $p/.ssh $p/.thunderbird $p/Videos $p/.vim $p/.vimrc $p/.wiic $p/.xinputrc $p/.Xresources $p/.zsh* $p/.gdbinit .
ln -s $p/Downloads/Linux Downloads

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

cd /tmp
git clone https://github.com/meskarune/i3lock-fancy.git
cd i3lock-fancy
sudo make install

cd /tmp
git clone https://aur.archlinux.org/ranger-git.git
cd ranger-git
makepkg -si

cd /tmp
git clone https://aur.archlinux.org/marker-git.git
cd marker-git
makepkg -si

git clone https://aur.archlinux.org/multibootusb.git
cd multibootusb
makepkg -si

sudo pacman -Syu
sudo pacman -S thunderbird firefox atom cmake cmatrix dia git nitrogen pulseaudio pandoc vim rofi curl pavucontrol numlockx ruby ocaml box2d irrlicht python-pip clang xfce4-terminal opam stlink bubblewrap #wine flatpak

# See https://www.fosslinux.com/2484/how-to-install-virtual-machine-manager-kvm-in-manjaro-and-arch-linux.htm
echo "Installation of KVM."
sudo pacman -S virt-manager qemu vde2 ebtables dnsmasq bridge-utils openbsd-netcat
sudo systemctl enable libvirtd.service
sudo systemctl start libvirtd.service

sudo ln -s $p/Downloads/Linux/IDEs/clion-2018.2.3/bin/clion.sh /usr/local/bin/clion

curl https://sh.rustup.rs -sSf | sh
cargo install mdbook
rustup component add rustfmt-preview

cd /tmp
sudo wget https://cht.sh/:cht.sh -O /usr/local/bin/cht.sh
sudo chmod o+x /usr/local/bin/cht.sh

sudo pip install cheat
gem install rdoc bundler jekyll

cd /tmp
curl -O http://mirror.veriportal.com/gnu/gsl/gsl-2.5.tar.gz
tar xvzf gsl-2.5.tar.gz
cd gsl-2.5
./configure
make -j 4
sudo make install
sudo gem install --conservative --no-ri --no-rdoc gsl

cd ~/Programs/ClubRobot/ClubRobotInsat.github.io

opam init
eval $(opam env)
opam install depext
opam depext conf-m4.1
opam init default 4.01.0+ocp-bin
opam switch
opam install ocaml-top --unlock-base
opam install merlin
opam user-setup install
