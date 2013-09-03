#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=poppler
PKG_VERSION:=0.24.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=http://poppler.freedesktop.org/
PKG_MD5SUM:=b11cc0408b4ad3809fa455d7b3d5ade9

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/poppler
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Poppler PDF rendering library
  DEPENDS:=+libpng +libtiff +libjpeg +zlib +lcms2 +fontconfig +libpthread +libfreetype +libstdcpp
  URL:=http://poppler.freedesktop.org/
  SUBMENU:=Printing
endef

define Package/poppler/description
	Poppler is a PDF rendering library based on the xpdf-3.0 code base.
endef

CONFIGURE_ARGS+= \
	--without-x \
	--disable-gtk-test \
	--disable-poppler-qt4 \
	--disable-poppler-qt5 \
	--disable-gtk-doc-html \
	--enable-gtk-doc-html=no \
	--enable-poppler-cpp \
	--enable-xpdf-headers \
	--enable-zlib \
	--enable-libjpeg \
	--enable-cms=lcms2 \
	--disable-poppler-cpp \
	--with-font-configuration=fontconfig

define Package/poppler/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/cpp $(1)/usr/lib
	$(CP) -r $(PKG_INSTALL_DIR)/usr/include/poppler $(1)/usr/include/
	$(CP) -r $(PKG_BUILD_DIR)/cpp/poppler-version.h $(1)/usr/include/cpp
	$(CP) -r $(PKG_BUILD_DIR)/cpp/poppler-global.h $(1)/usr/include/cpp
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib
endef

$(eval $(call BuildPackage,poppler))
