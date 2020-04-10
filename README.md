# Arch Linux Installation guide
## Update the system clock
```bash
timedatectl set-ntp true
```
To check the service status, use 
```bash timedatectl status```
## Partition the disks
```bash
cfdisk
```
```
fdisk -l
``` 
for checking list disk
## Format the partitions
```bash
mkfs.ext4 /dev/sdX1
```
for home and base system
```bash
hmkswap /dev/sdX2 
```
for swap partition

## Mounting the file systems
```bash
mount /dev/sdX1 /mnt 
```
for base system
```bash
mount /dev/sdX2 /mnt/home
```
for home partition
# Installation
## Select mirrors
```bash
vim /etc/pacman.d/mirrorlist
```
choose your closet mirrors
## Install essential packages
```bash
pacstrap /mnt base base-del linux linux-firmware sudo vim grub os-prober netctl dialog wpa_supplicant dhcpcd ppp
```





