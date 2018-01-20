# Printing

## Remote printer

### Configure `/etc/printcap`

Requirements:

 * `LPADDR=192.168.200.200` or `LPADDR=your-local-printer`

```
lp:\
        :rm=${LPADDR}:rp=raw:\
        :sh:\
        :mx#0:\
        :sd=/var/spool/lpd/lp:\
        :lf=/var/log/lpd-errs:
```

The `lpd` daemon has to be restarted.

### Print PDF files from a command line

```sh
pdf=file.pdf
ps=file.ps
pcl=file.pcl
printeraddr=192.168.0.13 # The name of the printer on the network.

# Printers prefer the PCL format.
pdf2ps "$pdf" "$ps"
cat "$ps" | gs -dSAFER -dNOPAUSE -q -sDEVICE=laserjet -sOutputFile=- - >"$pcl"

# If the lp service is configured then:
lpr "$pcl"
# otherwise it is possible to use netcat:
nc "$printeraddr" 9100 < "$pcl"
```

### References

 * https://www.freebsd.org/doc/handbook/printing.html
 * http://www.wonkity.com/~wblock/docs/html/lpdprinting.html
