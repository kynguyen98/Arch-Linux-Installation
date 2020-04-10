# Arch Linux Installation guide
## Update the system clock
```bash
timedatectl set-ntp true
```
To check the service status, use 
```timedatectl status```
## Partition the disks
```bash
cfdisk
```
```
fdisk -l
``` 
for checking list disk
## Format the partitions
```mkfs.ext4 /dev/sdX1
```
for home and base system
```
hmkswap /dev/sdX2 
```
for swap partition

## Mounting the file systems
```
mount /dev/sdX1 /mnt 
```
for base system
```
mount /dev/sdX2 /mnt/home
```
for home partition
# Installation
## Select mirrors
```
vim /etc/pacman.d/mirrorlist
```
choose your closet mirrors
## Install essential packages
```
pacstrap /mnt base base-del linux linux-firmware sudo vim grub os-prober netctl dialog wpa_supplicant dhcpcd ppp
```
# Configure the system
## Fstab 
Generate an **fstab** file use -U 
```
genfstab -U /mnt >> /mnt/etc/fstab
```
## Chroot
**Change root** into the new system
```
arch-chroot /mnt
```





