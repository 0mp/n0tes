# SSH

## Set up interfaces for VirtualBox Host-Only network

    auto eth1
    iface eth1 inet static
        address 192.168.56.102
        netmask 255.255.255.0
        gateway 192.168.56.1

([Source](https://forums.virtualbox.org/viewtopic.php?f=8&t=34396))

## Restart sshd

    systemctl restart ssh
