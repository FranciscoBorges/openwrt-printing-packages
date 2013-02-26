# Printing packages for OpenWrt

This is a [package feed] aiming at complete printing support in OpenWrt.

[package feed]: http://wiki.openwrt.org/doc/devel/feeds

It adds new packages and upgrades some others. Hopefully this will get
merged into [Barrier Breaker] at some point.

Notably it has:
- Ghostscript
- Gutenprint (CUPS)
- libijs
- lcms2

[Barrier Breaker]: https://dev.openwrt.org/milestone/Barrier%20Breaker%20%28trunk%29

## To use this feed,

- set up a [cross-compilation environment]
[cross-compilation environment]: http://wiki.openwrt.org/doc/devel/crosscompile

- add this line to your `feeds.conf.default`

```
src-git printing git://github.com/FranciscoBorges/openwrt-printing-packages.git
```

I've been testing these packages against Attitude Adjustment.
