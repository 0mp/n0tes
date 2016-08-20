Boot
====

Change the boot order of kernels in GRUB2
-----------------------------------------

Run

```sh
egrep ^menuentry /etc/grub2.cfg | cut -f 2 -d \'
```

to see the list of available kernels in the GRUB2 menu. Assuming that you want to make the
second listed kernel your default one, run:

```sh
grub2-set-default 1
```


SSH
===

Speed up sshing into CentOS VirtualBox
--------------------------------------

Edit `/etc/nsswitch.cong` so that

    # hosts: files nds

become

   hosts: files

([Source (link)](http://www.linuxquestions.org/questions/linux-newbie-8/why-it%27s-slow-to-ssh-connect-to-a-ubuntu-on-a-virtualbox-vm-4175536728/#post5333757))
