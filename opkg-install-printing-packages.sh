#!/bin/sh

# check opkg configuration
grep -H -n printing /etc/opkg.conf

opkg update

echo ""

opkg install fontconfig ghostscript-fonts-std liberation-fonts ubuntu-fonts ghostscript-gnu-gs-fonts-other
opkg install cups-client cups-bjnp ghostscript gutenprint-cups openprinting-cups-filters
opkg install avahi-daemon avahi-utils

/etc/init.d/avahi-daemon enable
/etc/init.d/cupsd enable
/etc/init.d/dbus enable

/etc/init.d/dbus restart

sleep 1

/etc/init.d/avahi-daemon restart

sleep 1

/etc/init.d/cupsd restart