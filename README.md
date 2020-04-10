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
pacstrap /mnt base base-del linux linux-firmware ntfs-3g sudo vim grub os-prober netctl dialog wpa_supplicant dhcpcd ppp
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
# Time zone 
Set the **time zone***
```
ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
```
Run **hwclock** to generate ```/etc/localtime```
```hwclock --systohc
```
# Localization
Uncomment ```en_US-UTF-8 YTF-8``` in ```/etc/locale.gen```, and generate them with:
```
locale-gen
```
Create the **locale.conf** file, and set the LANG ***variable*** accordingly:
```
/etc/locale.conf
LANG=en_US.UTF-8
```
# Network configuration
Create the **hostname** file:
```
/etc/hostname
myhostname
```
Add matching entries to **hosts(5)**:
```bash
/etc/hosts
127.0.0.1	localhost
::1		localhost
127.0.1.1	myhostname.localdomain	myhostname
```

# Initramfs
```
mkinitcpio -P
```
# Root password
Set the root **password:**
```
passwd
```
# Add non root user
```
useradd -m john
```
```
usermod -aG wheel,audio,video,optical,power,storage john
```
# Boot loader
```
grub-install --target=i386-pc /dev/sdX
```
# Generating grub config file
```
grub-mkconfig -o /boot/grub/grub.cfg
```









