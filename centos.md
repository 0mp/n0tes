# Auditing

## Configure `rsyslogd`

### Essentials

You'll need `certtool` to generate certificates.  It is included in the
`gnutls-utils` package.

### Generate keys

```sh
certtool --generate-privkey --outfile key.pem
```

# Boot

## Change the boot order of kernels in GRUB2

Run the following command to see the list of available kernels in the GRUB2
menu:

```sh
egrep ^menuentry /etc/grub2.cfg | cut -f 2 -d \'
```

Assuming that you want to make the second listed kernel your default one, run:

```sh
grub2-set-default 1
```

## Increase the console resolution

Open `/etc/default/grub` and add `vga=791` at the end of the
`GRUB_CMDLINK_LINUX` string.  Run `grub2-mkconfig -o /etc/grub2.cfg` and reboot
to have the changes applied.

The list of Linux video mode numbers is available [here (link)][centos.boot.1].

[centos.boot.1]: https://en.wikipedia.org/wiki/VESA_BIOS_Extensions#Linux_video_mode_numbers

# Network

## Change hostname

Change `/etc/hostname`.

# SSH

## Speed up sshing into CentOS VirtualBox

Edit `/etc/nsswitch.cong` so that

```text
# hosts: files nds
```

become

```text
hosts: files
```

([Source (link)](http://www.linuxquestions.org/questions/linux-newbie-8/why-it%27s-slow-to-ssh-connect-to-a-ubuntu-on-a-virtualbox-vm-4175536728/#post5333757))

