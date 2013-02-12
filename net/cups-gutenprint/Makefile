#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=gutenprint
PKG_VERSION:=5.2.9
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=@SF/gimp-print
PKG_MD5SUM:=aefbec27b96dd404d9ac9811e17d58ce

PKG_BUILD_DEPENDS:=cups-gutenprint/host cups libiconv
HOST_BUILD_DEPENDS:=libiconv/host
PKG_INSTALL:=1

include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/nls.mk

define Package/cups-gutenprint
  SECTION:=net
  CATEGORY:=Network
  TITLE:=cups-gutenprint -- Gutenprint CUPS drivers
  DEPENDS:=+cups +libiconv
  URL:=http://gimp-print.sourceforge.net/
endef

define Package/cups-gutenprint/description
	Gutenprint CUPS drivers for a wide range of Canon, Epson, HP and
	compatible printers.
endef

CONFIGURE_ARGS+= \
	--disable-nls \
	--disable-test \
	--without-doc \
	--without-readline \
	--without-foomatic \
	--without-foomatic3 \
	--enable-escputil=no \
	--enable-test=no \
	--disable-translated-cups-ppds \
	--disable-globalized-cups-ppds \
	--enable-simplified-cups-ppds \
	--bindir=/usr/bin \
	--sbindir=/usr/bin \
	--prefix=/usr \
	--exec-prefix=/usr

define Build/Compile
	# Replace the cross-compiled "extract-string" by a shell-script that
	# runs the host's own compiled version (gutenprint needs to run this)
	(cd $(PKG_BUILD_DIR) && $(MAKE) -C src/xml extract-strings && \
	$(RM) src/xml/extract-strings && \
	echo '#!/bin/sh' > src/xml/extract-strings && \
	echo 'exec $(HOST_BUILD_DIR)/src/xml/extract-strings  "$$$$@" ' \
	>> src/xml/extract-strings && chmod +x src/xml/extract-strings && cp src/xml/extract-strings /tmp/)
	$(call Build/Compile/Default)
endef

define Package/cups-gutenprint/install
	$(INSTALL_DIR) $(1)/usr/sbin $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/sbin/* $(1)/usr/sbin/
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/cups-calibrate $(1)/usr/bin/

	$(INSTALL_DIR) $(1)/usr/lib/cups/driver $(1)/usr/lib/cups/filter
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/cups/driver/gutenprint.* $(1)/usr/lib/cups/driver
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/cups/filter/* $(1)/usr/lib/cups/filter
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/libgutenprint.so* $(1)/usr/lib
	$(INSTALL_DIR) $(1)/usr/share/cups/mime
	$(CP) $(PKG_INSTALL_DIR)/etc/cups/command.types $(1)/usr/share/cups/mime
	$(INSTALL_DIR) $(1)/usr/share/gutenprint
	$(CP) $(PKG_INSTALL_DIR)/usr/share/gutenprint/[0-9]*.[0-9]* $(1)/usr/share/gutenprint
endef

define Host/Compile
  $(MAKE) $(HOST_JOBS) -C $(HOST_BUILD_DIR)/src/xml $(HOST_MAKE_FLAGS) extract-strings
endef

define Host/Install
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,cups-gutenprint))
