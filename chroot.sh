#! /bin/sh

# Variable
arch-chroot /mnt 
# Export vim as editor
ln -s /usr/bin/vim /usr/bin/vi
# Enable user in the wheel group to have sudo access by uncommenting this line
sed '# %wheel ALL=(ALL) ALL s/# %wheel ALL=(ALL) ALL/%wheel ALL=(ALL) ALL' /etc/sudoers
# set timezone 
ls /usr/share/zoneinfo/
read -p 
