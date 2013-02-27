#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ijs
PKG_VERSION:=0.35
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=http://www.openprinting.org/download/ijs/download/
PKG_MD5SUM:=896fdcb7a01c586ba6eb81398ea3f6e9

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/libijs
  SECTION:=libs
  CATEGORY:=Libraries
  TITLE:=IJS raster image transport protocol
  SUBMENU:=Printing
endef

define Package/libijs/description
	IJS raster image transport protocol
endef

define Package/libijs/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/ijs $(1)/usr/lib
	$(CP) -r $(PKG_INSTALL_DIR)/usr/include/ijs $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib
endef

$(eval $(call BuildPackage,libijs))
