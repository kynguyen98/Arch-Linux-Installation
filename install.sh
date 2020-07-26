#! /bin/sh

# Command variable
time="timedatectl set-ntp true"
core_package=('base' 'base-devel' 'linux' 'linux-firmware' 
	'ntfs-3g' 'sudo' 'vim' 'grub' 'os-prober' 'netctl' 'dialog' 'wpa_supplicant' 'dhcpcd ppp')
# Function
installing(){
	for list in $(core_package[@])
	do
		pacstrap /mnt $list
	done
}


echo "Setting up date and time"

if $time; then
	printf "setting up date and time successful\n"
else 
	printf "failed\n"
fi

# Ask for disk is formatted

read -p "Is your disk formatted? [yes/no] " answer
# if not then initialize cfdisk if yes skip 
if $answer=="yes"
	lsblk
else
	cfdisk
fi

echo "choose your partition"
# user input partition
echo "Eg: /dev/sda1"
read -p "where is home? " home
read -p "where is swap? " swap
read -p "where is root? " root

echo "formatting and mounting"
# formatting disk
# home
mkfs.ext4 home
# root
mkfs.ext4 root
# swap 
mkswap swap
swap on swap

mount home /mnt
mkdir -p /mnt/home
mount home /mnt/home

echo "editing mirror (choose your closet server)"
vim /etc/pacman.d/mirrorlist

echo "installing core packages"
installing

echo "Generate an fstab file use -U"
genfstab -U /mnt >> /mnt/etc/fstab


# 
