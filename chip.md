# Headless

## Login over a USB connection

Manual suggests using:

```sh
screen /dev/tty.usbserial 115200
```

or:

```sh
screen /dev/ttyUSB0 115200
```

This worked for me:

```shell
screen /dev/tty.usbmodemFD121
```

Source: [docs: headless]

---

# Networking

## List available Wi-Fi's

```sh
nmcli device wifi list
```

Source: [docs: wifi]

---

## Connect to a password protected network

```sh
sudo nmcli device wifi connect '(your wifi network name/SSID)' password '(your wifi password)' ifname wlan0
```

Source: [docs: wifi]

---

[docs: headless]: http://docs.getchip.com/chip.html#headless-chip
[docs: wifi]: http://docs.getchip.com/chip.html#wifi-connection
