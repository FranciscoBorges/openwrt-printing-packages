# Printing packages for OpenWrt

This is a [package feed] aiming at complete printing support in OpenWrt.

[package feed]: http://wiki.openwrt.org/doc/devel/feeds

It adds new packages and upgrades some others. Hopefully this will get
merged into [Barrier Breaker] at some point.

Notably it has:
- Ghostscript
- Ghostscript fonts
- Gutenprint (CUPS)
- libijs
- lcms2
- fontconfig

[Barrier Breaker]: https://dev.openwrt.org/milestone/Barrier%20Breaker%20%28trunk%29

### Missing / TODO

- Package/compile OpenPrinting's cups-filters (which is a much improved fork of the CUPS cups-filters code which got dropped at CUPS 1.6), and its dependencies (e.g. poppler).
- configure fontconfig;
- make packages installing fonts work correctly with it
- make CUPS play nice with Avahi by default
- review installation of packages, as it is all somewhat a mess right now

### To use this feed,

- set up a [cross-compilation environment]
[cross-compilation environment]: http://wiki.openwrt.org/doc/devel/crosscompile

- add this line to your `feeds.conf.default`

```
src-git printing git://github.com/FranciscoBorges/openwrt-printing-packages.git
```

I've been testing these packages against Attitude Adjustment.
