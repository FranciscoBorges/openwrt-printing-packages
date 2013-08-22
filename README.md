# Printing packages for OpenWrt

This is a [package feed] aiming at providing a complete printing stack
for OpenWrt.

Notably it has:
- Ghostscript
- Gutenprint (CUPS)
- OpenPrinting's cups-filters
- fontconfig
- other packages to make sure the ones above work...

[package feed]: http://wiki.openwrt.org/doc/devel/feeds

[timesys.com]: http://repository.timesys.com/buildsources/g/ghostscript/

### To use this feed,

- set up your router to use [external storage] for its root file
  system, as these packages require more than a 100 MB of space.

[external storage]: http://wiki.openwrt.org/doc/howto/extroot

- set up a [cross-compilation environment]
[cross-compilation environment]: http://wiki.openwrt.org/doc/devel/crosscompile

- add this line to your `feeds.conf` or `feeds.conf.default`

```
src-git printing git://github.com/FranciscoBorges/openwrt-printing-packages.git
```

- to compile everything in this feed you should use the script `setup-buildsystem.sh`

- copy compiled packages to your router

```
scp -r ./bin/$ARCH/packages root@openwrt.lan:/storage/printer/packages/
```

- add local package source to the opkg configuration `/etc/opkg/conf` with

```
src/gz printing file:/storage/printer/packages
```

- see `opkg-install-printing-packages.sh` to see a suggestion of what to install.

- tested against Attitude Adjustment (because that is what I have installed...).

- use [AirPrint Generate] to make your printers visible to iOS devices through Avahi.

[AirPrint Generate]: https://github.com/tjfontaine/airprint-generate

### Issues / Missing / TODO

Caveat 1: Ghostscript lacks proper cross-compilation support. I used a
patch taken from [timesys.com]. If your architecture is not there, it
just won't work for you.

- make CUPS play nice with Avahi by default (i.e. AirPrint does not work out of box)
- the font cache will likely get lost on a reboot.
