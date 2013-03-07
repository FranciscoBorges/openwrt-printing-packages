#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ghostscript-gnu-gs-fonts-other
PKG_VERSION:=6.0
PKG_RELEASE:=1
PKG_SOURCE:=gnu-gs-fonts-other-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/gs-fonts
PKG_MD5SUM:=33457d3f37de7ef03d2eea05a9e6aa4f

include $(INCLUDE_DIR)/package.mk

PKG_UNPACK:=gzip -dc $(DL_DIR)/$(PKG_SOURCE) | $(TAR) -C $(PKG_BUILD_DIR) $(TAR_OPTIONS)

define Package/ghostscript-gnu-gs-fonts-other
  SECTION:=fonts
  CATEGORY:=Network
  TITLE:=ghostscript-gnu-gs-fonts-other
  SUBMENU:=Printing
  DEPENDS:=+fontconfig
endef

define Package/ghostscript-gnu-gs-fonts-other/description
	Ghostscript, the 'other' standard fonts.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/ghostscript-gnu-gs-fonts-other/install
	$(INSTALL_DIR) $(1)/usr/share/fonts/ghostscript
	$(CP) $(PKG_BUILD_DIR)/fonts $(1)/usr/share/fonts/ghostscript
endef

define Package/ghostscript-gnu-gs-fonts-other/postinst
#!/bin/sh
/usr/bin/fc-cache --force --verbose
endef

$(eval $(call BuildPackage,ghostscript-gnu-gs-fonts-other))
