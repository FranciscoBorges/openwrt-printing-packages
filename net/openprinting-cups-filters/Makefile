#
# Copyright (C) 2007-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=openprinting-cups-filters
PKG_VERSION:=1.0.29
PKG_RELEASE:=1

PKG_SOURCE:=cups-filters-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=http://www.openprinting.org/download/cups-filters/
PKG_MD5SUM:=01e2d9abc4ea69521334a0ee2f70d98a
PKG_BUILD_DIR:=$(BUILD_DIR)/cups-filters-$(PKG_VERSION)

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/openprinting-cups-filters
  SECTION:=Net
  CATEGORY:=Network
  TITLE:=OpenPrinting CUPS filters
  DEPENDS:=+cups +fontconfig +libijs +libtiff +libjpeg-turbo +libpng @BROKEN
  URL:=http://www.openprinting.org
  SUBMENU:=Printing
endef

define Package/openprinting-cups-filters/description
	CUPS filters maintained by OpenPrinting.
	The CUPS Filters package contains backends, filters and other software that was once part of the core CUPS distribution but is no longer maintained by Apple Inc.
endef

define Build/Configure
	$(call Build/Configure/Default, \
	--enable-imagefilters \
	--with-pdftops=gs \
	--with-gs-path=/usr/bin/gs \
	--with-pdftops-path=/usr/bin/gs \
	--disable-gnutls \
	--disable-openssl \
	--disable-cdsassl \
	--disable-ssl \
	--disable-gssapi \
	)
endef

define Package/openprinting-cups-filters/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib
endef

define Package/preinst
#!/bin/sh
# Get rid of any files from CUPS 1.5.X cups-filters.
# See OpenPrinting's cups-filters-X.X.X/INSTALL
rm /usr/lib/cups/backend/serial
rm /usr/lib/cups/backend/parallel
rm /usr/lib/cups/filter/bannertops
rm /usr/lib/cups/filter/commandtoescpx
rm /usr/lib/cups/filter/commandtopclx
rm /usr/lib/cups/filter/imagetops
rm /usr/lib/cups/filter/imagetoraster
rm /usr/lib/cups/filter/pdftops
rm /usr/lib/cups/filter/rastertoescpx
rm /usr/lib/cups/filter/rastertopclx
rm /usr/lib/cups/filter/texttops
rm /usr/share/cups/banners/*
rm /usr/share/cups/data/testprint
rm /usr/share/cups/data/psglyphs
rm /usr/share/cups/fonts/*
endef

$(eval $(call BuildPackage,openprinting-cups-filters))
