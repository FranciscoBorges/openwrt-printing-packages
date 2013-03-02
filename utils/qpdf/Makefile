#
# Copyright (C) 2007-2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=qpdf
PKG_VERSION:=4.0.1
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=@SF/$(PKG_NAME)
PKG_MD5SUM:=093baece867a0a7e07774bd4008156b3

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/qpdf
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=QPDF is a command-line program for transformations on PDF files.
  DEPENDS:= +libpcre +zlib +libstdcpp
  URL:=http://qpdf.sourceforge.net/
  SUBMENU:=Printing
endef

define Package/qpdf/description
QPDF is a command-line program that does structural, content-preserving
transformations on PDF files. It could have been called something like pdf-to-pdf.
It also provides  many useful capabilities to developers of PDF-producing software
or for people who just want to look at the innards of a PDF file to learn more
about how they work.
endef

define Package/qpdf/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

define Build/Compile
	$(call Build/Compile/Default, LIBTOOL="./libtool --tag=CXX")
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/include
	$(CP) -r $(PKG_INSTALL_DIR)/usr/include/$(PKG_NAME) $(1)/usr/include/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib
endef

$(eval $(call BuildPackage,qpdf))
