Change the boot order of kernels in GRUB2
=========================================

Run

```sh
egrep ^menuentry /etc/grub2.cfg | cut -f 2 -d \'
```

to see the list of available kernels in the GRUB2 menu. Assuming that you want to make the 
second listed kernel your default one, run:

```sh
grub2-set-default 1
```
