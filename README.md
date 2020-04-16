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
```bash
fdisk -l
``` 
for checking list disk
## Format the partitions
``` bash
mkfs.ext4 /dev/sdX1
```
for home and base system
```bash
mkswap /dev/sdX2 
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
## On Manjaro linux when installing Arch on USB or ext. HDD
```bash
sudo pacman-mirrors -g
```
choose your closet mirrors
## Install essential packages
```bash
pacstrap /mnt base base-devel linux linux-firmware ntfs-3g sudo vim grub os-prober netctl dialog wpa_supplicant dhcpcd ppp
```
# Configure the system
## Fstab 
Generate an **fstab** file use -U 
```bash
genfstab -U /mnt >> /mnt/etc/fstab
```
## Edit the sudoers file
Enable user in the wheel group to have sudo access by uncommenting this line ```# %wheel ALL=(ALL) ALL```
## Export vim as editor
```
ln -s /usr/bin/vim /usr/bin/vi
```

## Chroot
**Change root** into the new system
```bash
arch-chroot /mnt
```
# Time zone 
Set the **time zone***
```bash
ln -sf /usr/share/zoneinfo/America/Los_Angeles /etc/localtime
```
Run **hwclock** to generate ```/etc/localtime```
``` bash
hwclock --systohc
```
# Localization
Uncomment ```en_US-UTF-8 YTF-8``` in ```/etc/locale.gen```, and generate them with:
```bash
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
```bash
mkinitcpio -P
```
# Root password
Set the root **password:**
```bash
passwd
```
# Add non root user
```bash
useradd -m john
```
```bash
usermod -aG wheel,audio,video,optical,power,storage john
```
# Boot loader
```bash
grub-install --target=i386-pc /dev/sdX
```
# Generating grub config file
```bash
grub-mkconfig -o /boot/grub/grub.cfg
```
# Network configuration
Start Netctl service
```bash
sudo systemctl start netctl
```
```bash
sudo systemctl netctl-auto@wls3.service
```







