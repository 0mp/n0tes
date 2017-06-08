## System Administration Troubleshooting

---

### Broken `man -k`

`man -k`, `apropos` and `whatis` don't work. It looks like `whatis` database is
missing.

The solution is to run `makewhatis(1)`.

See also:

- `freebsd-update` and `whatis`: https://forums.freebsd.org/threads/53194/
- `/etc/periodic/`

---

### How to mount ext4?

```sh
pkg install fusefs-ext4fuse
kldload fuse.ko
mount /dev/da0p1 /mnt
```

See also:

- http://blog.ataboydesign.com/2014/04/23/freebsd-10-mounting-usb-drive-with-ext4-filesystem/
- https://www.freebsd.org/doc/handbook/usb-disks.html
