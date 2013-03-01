# Printing packages for OpenWrt

This is a [package feed] aiming at complete printing support in OpenWrt.

[package feed]: http://wiki.openwrt.org/doc/devel/feeds

Caveat 1: this is *work in progress*

Caveat 2: Ghostscript lacks proper cross-compilation support. I used a
patch taken from [timesys.com]. If your architecture is not there, it
just won't work for you.

[timesys.com]: http://repository.timesys.com/buildsources/g/ghostscript/

It adds new packages and upgrades some others.

Notably it has:
- Ghostscript
- Gutenprint (CUPS)
- OpenPrinting's cups-filters
- fontconfig
- Ghostscript fonts
- poppler
- qpdf
- libijs
- lcms2
- etc...

### Missing / TODO

- configure fontconfig;
- make packages installing fonts work correctly with it
- install Red Hat liberation fonts?
- install Ubuntu fonts
- make CUPS play nice with Avahi by default
- review installation of packages, as it is all somewhat a mess right now
- the font cache will likely get lost on a reboot.

### To use this feed,

- set up your router to use [external storage] for its root file system.
[external storage]: http://wiki.openwrt.org/doc/howto/extroot

- set up a [cross-compilation environment]
[cross-compilation environment]: http://wiki.openwrt.org/doc/devel/crosscompile

- add this line to your `feeds.conf.default`

```
src-git printing git://github.com/FranciscoBorges/openwrt-printing-packages.git
```
- Notice that AFAICT when there are 2 packages with the same name and different versions, it seems to be a toss which one will get picked. Delete whichever duplicated packages from your feeds (e.g. ```cups```, ```cups-bjnp```).

- tested against Attitude Adjustment (because that is what I have installed...).
