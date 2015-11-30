# Installation

```
wifi-menu
cfdisk /dev/sda
mkfs.ext4 /dev/sda1
mkswap /dev/sda2
swapon /dev/sda2
mount /dev/sda1 /mnt
vi /etc/pacman.d/mirrorlist
pacstrap -i /mnt base base-devel
genfstab -U -p /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
arch-chroot /mnt
vi /etc/locale.gen
locale-gen
echo LANG=en_GB.UTF-8 > /etc/locale.conf
export LANG=en_GB.UTF-8
ln -s /usr/share/zoneinfo/Europe/Warsaw > /etc/localtime
hwclock --systohc --utc
echo your_fancy_host_name > /etc/hostname
vi /etc/pacman.conf
    # [archlinuxfr]
    # SigLevel = Never
    # Server = http://repo.archlinux.fr/$arch
pacman -Sy
passwd
useradd -m -g users - G wheel,storage,power -s /bin/bash your_username
passwd your_username
pacman -S sudo
EDITOR=vi visudo
    # %wheel ALL=(ALL) ALL
pacman -S bash-completion
pacman -S grub
grub-install --target=i386-pc --recheck /dev/sda
pacman -S os-prober
grub-mkconfig -o /boot/grub/grub.cfg
ip link
systemctl enable dhcpcd@NAME-OF-THE-NETWORK.service
pacman -S wireless_tools network-tools iw dialog
exit 
umount -R /mnt
reboot
```

```
pacman -S tmux
```
