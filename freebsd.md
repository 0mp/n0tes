FreeBSD
=======

## Boot

### Live CD boot

My old laptop decided to boot after setting **ACPI Support** and **Safe Mode** options ON.


### Dual boot GNU/Linux and FreeBSD using GRUB 2

1. Boot GNU/Linux.
2. Create `/boot/grub2/custom.cfg` file.
3. Add these lines to the file:

        menuentry "FreeBSD" {
        set root='(hd0,3)'
        kfreebsd /boot/loader
        }

([Source](https://srobb.net/grub2.html))


### Fix `run_interrupt_driven_hooks still waiting after 60 seconds for xpt_config`

Append those lines to the `/boot/device.hints` file:

    hint.ata.0.disabled="1"
    hint.ata.1.disabled="1"


### So you cannot boot because you broke loader.conf, huh?

Let's say you've added `kern.vty=vt` to your `/boot/loader.conf` and now your FreeBSD won't boot.

1. **Escape to loader prompt** in the boot menu.
2. Type `set ketn.vty=""`.
3. Type `boot`.
4. Log in and remove that awful line from `loader.conf`.


## Keyboard

### Set the key repeat rate

Add `xset r rate MS_DELAY RATE` to `.xinitrc`.


### Remap Caps Lock to Control

#### In the console mode (tty)

Keymaps are stored in `/usr/share/vt/keymaps`.
**scan code** number 058 is represents the Caps Lock key.

Although it should be possible [to load your custom keymap in `/etc/rc.conf`](https://www.geeklan.co.uk/?p=1274)
I failed to do it. Instead I put [`/usr/sbin/kbdcontrol -l ~/my-keyboard-mappings`](http://www.freebsddiary.org/kbdcontrol.php)
into my `~/.bashrc`.

#### In the X server

Add `setxkbmap -option ctrl:nocaps` to your `.xinitrc`.


## Network

### WiFi TP-LINK TL-WN321G drivers

Add `if_rum_load="YES"` to `/boot/loader.conf`.


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

* Fetch the newest makefiles.

        portsnap fetch update

* Then to update all the old ports.

        portmaster -a

    **Don't do it.**

    It might take very long because

    >       sudo portmaster -a
    >
    > This will update all of the ports on the system to their newest version.
    > Any new configuration options will be presented to you at the beginning of the process.
    > If you have any packages installed with pkg with newer versions available
    > through the ports system, these will be updated and transitioned over to ports as well.

([Source](https://www.digitalocean.com/community/tutorials/how-to-install-and-manage-ports-on-freebsd-10-1))

    Consider using the `-d` option to automatically delete old files. Still awful slow. ([Source](https://lists.freebsd.org/pipermail/freebsd-questions/2012-July/243052.html))


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


## Time and date

### Synchronize with the global time using ntp

Add `ntpd_sync_on_start="YES"` to  `/etc/rc.conf` so that ntpd sync with the server on start.

([Source](https://forums.freebsd.org/threads/16295/))


## User accounts

### Add a user to the wheel

    sudo pw group mod wheel -m <username>


## Video

### Change the video mode

If the screen resolution is too small then you can change it using these commands.

([Source](https://www.freebsd.org/doc/en_US.ISO8859-1/books/handbook/consoles.html))

    # Load the vesa module.
    kldload vesa
    # Show available modes.
    vidcontrol -i mode
    # Choose one of the modes. 278 for example.
    vidcontrol MODE_278


## Window manager

### dwm

Awful.

<http://agreif.blogspot.com/2014/03/configure-dwm-on-freebsd.html>
<https://forums.freebsd.org/threads/7816://forums.freebsd.org/threads/7816/>
<https://srobb.net/dwm.html>


### i3wm


#### Installation

<http://bottlenix.wikidot.com/installing-i3wm>

#### Basics

| Action | Shortcut |
|--------|----------|
| Open a new terminal | mod + Enter |
| Split vertically | mod + v |
| Split horizontally | mod + h |
| Change to splith/splitv layout | mod + e |
| Change to stacking layout | mod + s |
| Change to tabbed layout | mod + w |
| Go fullscreen | mod + f |
| Close a window | C + w |
| Kill a window | mod + S + q |
| Go to a workspace | mod + num |
| Move to a workspace | mod + S + num |
| Restart i3 inplace | mod + S + r |
| Exit i3 | mod + S + e |
| Toggle floating mode | mod + S + Space |

#### Configs

* [1](https://github.com/giacomos/i3wm-config)
* [2](http://blog.tunnelshade.in/2014/05/making-i3-beautiful.html)
* [3](http://i3wm.org/docs/userguide.html#_scratchpad)


### Mate

<https://www.youtube.com/watch?v=YncqBz0bZcQ>


### OpenBox

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

<http://daemon-notes.com/articles/desktop/openbox>
<https://forums.freebsd.org/threads/35308/>

#### tint2
If you want to run `tint2` on the startup the add a `tint2 &` line to your
autostart.sh.

([Source](https://www.youtube.com/watch?v=k_-W8XmOycs))


## Network

### Connect to eduroam

1. Add the following content to `/etc/wpa_supplicant.conf`:

        network={
            ssid="eduroam"
            proto=WPA WPA2
            key_mgmt=WPA-EAP
            eap=PEAP
            group=TKIP
            identity="<pesel>@uw.edu.pl"
            password="secretsexgod"
        }

2. Append to `/etc/rc.conf`:

        ifconfig_wlan0="WPA DHCP" # Change wlan0 to your interface.

3. Restart.

        /etc/rc.d/netif restart

([Source](http://www.bishnet.net/tim/blog/2008/11/07/eduroam-on-freebsd/))


## Video

### Allow brightness control.

Add `acpi_video_load="YES"` to `/boot/loader.conf`e

([Source 1](https://forums.freebsd.org/threads/6186/))
([Source 2](https://forums.freebsd.org/threads/39771/))


## The FreeBSD Project

### Using your @FreeBSD email alias with Gmail.

Of course you should start from obtaining your FreeBSD alias from the FreeBSD admins.

1. Turn on the 2-step authentication at <https://myaccount.google.com/security/signinoptions/two-step-verification>.
2. Go to <https://security.google.com/settings/security/apppasswords>.
3. Log in using your Gmail account.
4. In **Select app** choose **Other (Customised name)** and in **Select device** choose **Other (Customised name)**.
5. Click **GENERATE**.
6. Name it as *FreeBSD* or something.
7. Copy your new app password to the clipboard.
8. Go to <https://gmail.com> and open **Settings**.
9. Go to **Accounts and Import**, then in the **Send mail as:** section click **Add another email address that you own**. A window titled **Gmail - Add another email address that you own** should pop up.
10. Enter your name and your FreeBSD email alias like *0mp@FreeBSD.org* (_Note that you should use your own username connected to your Gmail account by the FreeBSD admins instead of 0mp). Make sure that **Treat as an alias.** is checked. Proceed.
11. Now fill in the information as follows:
    * **SMPTP Server**: smtp.gmail.com
    * **Port**: 587
    * **Username**: youralias@gmail.com
    * **Password**: *The one time password you've generated a couple of steps earlier.*
    * Check **Secured connection using TLS (recommended)**

    Click **Add Account**.

12. You should receive an email with a confirmation that you want to allow Gmail to use your FreeBSD alias. The email should contain both a special code or a link to click. The easiest way is to just click the provided link so that your decision is approved.
13. Cheers! You should be able to send emails using your @FreeBSD address from Gmail.
