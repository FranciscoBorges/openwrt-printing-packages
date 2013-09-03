#!/bin/sh

opkg remove 'cups*' --force-removal-of-dependent-packages libjpeg-turbo
opkg remove --force-removal-of-dependent-packages 'libcups*'
opkg remove 'ghostscript*'
opkg remove --force-removal-of-dependent-packages lcms2 libijs qpdf libfreetype fontconfig poppler
opkg remove avahi-utils libavahi-client
opkg remove avahi-daemon
