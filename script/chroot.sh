# Utiliser une prison virtuelle pour reprendre le contrôle d'Ubuntu avec Internet
# See: https://superuser.com/questions/111152/whats-the-proper-way-to-prepare-chroot-to-recover-a-broken-linux-installation
cd /
sudo mount -t ext4 /dev/sda5 /mnt
sudo mount -t proc proc /mnt/proc
sudo mount -t sysfs sys /mnt/sys
sudo mount -o bind /dev /mnt/dev
sudo cp -L /etc/resolv.conf /mnt/etc/resolv.conf
sudo chroot /mnt /bin/bash
