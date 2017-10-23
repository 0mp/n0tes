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

# Virtual terminal

## Screen goes black after a few minutes of uptime

Run

```sh
cat /sys/module/kernel/parameters/consoleblank
```

and if it's not 0 then call

```sh
setterm -blank 0
```

Details: https://unix.stackexchange.com/a/32043/128489
