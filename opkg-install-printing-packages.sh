#!/bin/sh
opkg install fontconfig ghostscript-fonts-std liberation-fonts ubuntu-fonts ghostscript-gnu-gs-fonts-other
opkg install cups-client cups-bjnp ghostscript gutenprint-cups openprinting-cups-filters
opkg install avahi-daemon avahi-utils

/etc/init.d/cups enable
/etc/init.d/avahi-daemon enable