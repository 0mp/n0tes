FreeBSD
=======

## Live CD boot

My old laptop decided to boot after setting **ACPI Support** and **Safe Mode** options ON.


## Dual boot GNU/Linux and FreeBSD using GRUB 2

1. Boot GNU/Linux.
2. Create `/boot/grub2/custom.cfg` file.
3. Add these lines to the file:

        menuentry "FreeBSD" {
        set root='(hd0,3)'
        kfreebsd /boot/loader
        }

([Source](https://srobb.net/grub2.html))


## WiFi TP-LINK TL-WN321G drivers

Add `if_rum_load="YES"` to `/boot/loader.conf`.


## Fix `run_interrupt_driven_hooks still waiting after 60 seconds for xpt_config`

Append those lines to the `/boot/device.hints` file:

    hint.ata.0.disabled="1"
    hint.ata.1.disabled="1"

## Change the video mode

If the screen resolution is too small then you can change it using these commands.

([Source](https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/consoles.html))

    # Load the vesa module.
    kldload vesa
    # Show available modes.
    vidcontrol -i mode
    # Choose one of the modes. 278 for example.
    vidcontrol MODE_278


## Software installation

([Handbook reference](https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/ports-finding-applications.html))

### Packages

* Check for known vulnerabilities.

       pkg audit -F

* Serach for packages.

       pkg search git

* List packages by origin.

        pkg search -o git

* Information about installed packages.

        pkg info pkg

### Ports

    portsnap fetch update

Then to update all the old ports:

    portmaster -a

It might take very long because

>       sudo portmaster -a
>
> This will update all of the ports on the system to their newest version. Any new configuration options will be presented to you at the beginning of the process. If you have any packages installed with pkg with newer versions available through the ports system, these will be updated and transitioned over to ports as well.

([Source](https://www.digitalocean.com/community/tutorials/how-to-install-and-manage-ports-on-freebsd-10-1))

Consider using the `-d` option to automatically delete
old files. ([Source](https://lists.freebsd.org/pipermail/freebsd-questions/2012-July/243052.html))

### Update software

    freebsd-update fetch && freebsd-update install

([Source](https://forums.freebsd.org/threads/15799/#post-93783))

#### The Handbook way

This soltuion feels a little bit broken.

    portsnap fetch
    portsnap extract
    cd /usr/ports/ports-mgmt/portmaster
    make install clean
    portmaster -a

#### The 0mp way

    freebsd-update fetch && freebsd-update install
    pkg version -vIl '<'
    pkg upgrade


## Synchronize with the global time using ntp

Add `ntpd_sync_on_start="YES"` to  `/etc/rc.conf` so that ntpd sync with the server on start.

([Source](https://forums.freebsd.org/threads/16295/))


## Add a user to the wheel

    sudo pw group mod wheel -m <username>

## Install OpenBox

    su
    freebsd-update fetch && freebsd-update install
    pkg install xorg openbox tint2
    cd ~
    mkdir .config
    cd .config
    mkdir openbox
    mkdir tint2
    cp /usr/local/etc/xdg/openbox/*.xml openbox/
    echo '#!/bin/sh' >> openbox/autostart.sh
    chmod +x openbox/autostart.sh
    echo 'hald_enable="YES"' >> /etc/rc.conf
    echo 'exec openbox-session' >> ~/.xinitrc

