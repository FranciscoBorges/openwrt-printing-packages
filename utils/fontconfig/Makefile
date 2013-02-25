#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=fontconfig
PKG_VERSION:=2.10.91
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://fontconfig.org/release/
PKG_MD5SUM:=c795bb39fab3a656e5dff8bad6a199f6

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/fontconfig
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Fontconfig, configure and customize font access
  DEPENDS:=+libfreetype +libexpat +libpthread
  URL:=http://fontconfig.org
  SUBMENU:=Printing
endef

define Package/fontconfig/description
	The Fontconfig package contains a library and support programs used for
        configuring and customizing font access.
endef

CONFIGURE_ARGS+= --disable-docs

define Package/fontconfig/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/include $(1)/usr/lib
	$(CP) $(PKG_INSTALL_DIR)/usr/include/* $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib
endef

$(eval $(call BuildPackage,fontconfig))
