## Mouse

### Basic support

- Add to `/etc/rc.conf`:

  ```sh
  moused_enable="YES
  ```

- Add to `/usr/local/etc/X11/xorg.conf.d/11-synaptics-trackpad.conf`:

  ```
  Section "InputDevice"
        Identifier  "Touchpad0"
        Driver      "synaptics"
        Option      "Protocol" "psm"
        Option      "Device" "/dev/psm0"
        Option      "VertEdgeScroll" "off"
        Option      "VertTwoFingerScroll" "on"
        #Option      "HorizEdgeScroll" "off"
        #Option      "HorizTwoFingerScroll" "on"
        Option      "VertScrollDelta" "-111"
        #Option      "HorizScrollDelta" "-111"
        Option      "ClickPad" "on"
        #Option      "SoftButtonAreas" "4201 0 0 1950 2710 4200 0 1950"
        #Option      "AreaTopEdge" "5%"
  EndSection
  ```

  I am not sure if it is needed however.

- Add to `/boot/loader.conf`:

  ```sh
  hw.psm.synaptics_support="1"

  ```

### Natural scrolling

Set in `~/.Xmodmap`:

```
pointer = 1 2 3 5 4 6 7 8 9 10
```

### See also

- https://www.tomek.cedro.info/page/2/
- http://kartowicz.com/dryobates/2014-02/synaptics-freebsd/
- https://lists.freebsd.org/pipermail/freebsd-mobile/2016-April/013404.html
