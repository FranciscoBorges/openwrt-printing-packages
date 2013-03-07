#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ghostscript-fonts-std
PKG_VERSION:=8.11
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/gs-fonts
PKG_MD5SUM:=6865682b095f8c4500c54b285ff05ef6

include $(INCLUDE_DIR)/package.mk

PKG_UNPACK:=gzip -dc $(DL_DIR)/$(PKG_SOURCE) | $(TAR) -C $(PKG_BUILD_DIR) $(TAR_OPTIONS)

define Package/ghostscript-fonts-std
  SECTION:=fonts
  CATEGORY:=Network
  TITLE:=ghostscript-fonts-std
  SUBMENU:=Printing
  DEPENDS:=+fontconfig
endef

define Package/ghostscript-fonts-std/description
	Ghostscript, standard fonts.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/ghostscript-fonts-std/install
	$(INSTALL_DIR) $(1)/usr/share/fonts/ghostscript
	$(CP) $(PKG_BUILD_DIR)/fonts $(1)/usr/share/fonts/ghostscript
endef

define Package/ghostscript-fonts-std/postinst
#!/bin/sh
/usr/bin/fc-cache --force --verbose
endef

$(eval $(call BuildPackage,ghostscript-fonts-std))
