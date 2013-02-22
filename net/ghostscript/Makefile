#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ghostscript
PKG_VERSION:=9.06
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://downloads.ghostscript.com/public/$(PKG-SOURCE)
# 9.06
PKG_MD5SUM:=153ddb0622cb155d2f600146f1e28d84
# 9.05
#PKG_MD5SUM:=8bcef1f33ddf8a4d12b2cf8da385c191

PKG_BUILD_DEPENDS:=ghostscript/host
PKG_INSTALL:=1

# During its build Ghostscript needs to run some binaries of its
# own. Thus the 'host-build'
include $(INCLUDE_DIR)/host-build.mk
include $(INCLUDE_DIR)/package.mk

define Package/ghostscript
  SECTION:=net
  CATEGORY:=Network
  TITLE:=ghostscript
  DEPENDS:=+cups +libcupsimage +libfreetype +libtiff +libpng +libexpat +lcms2 +zlib +ghostscript-fonts-std
#  DEPENDS:=+cups +libcupsimage +libtiff +libpng +libexpat +lcms2 +zlib +ghostscript-gnu-gs-fonts +ghostscript-std-fonts
  SUBMENU:=Printing
endef

define Package/ghostscript/description
	Ghostscript, an interpreter for the PostScript language and for PDF.
endef

define Build/Configure
	(cd $(PKG_BUILD_DIR) && $(RM) -r expat jasper freetype lcms2 lcms libpng tiff zlib)
	$(call Build/Configure/Default, \
	--disable-gtk	\
	--without-libidn \
	--without-x \
	--without-jasper \
	--without-jbig2dec  \
	--with-install-cups \
	--with-system-libtiff \
	--with-cups-serverbin="/usr/lib/cups" \
	--with-cups-serverroot="/etc/cups" \
	--with-cups-datadir="/usr/share/cups")
endef

define Build/Compile
	# base/unix-aux.mak is patched, and now we replace these fixed strings by the actual paths.
	# PS. doing all in sed would be painful because the commands would need too much escaping.
	$(SED) 's,OPENWRT_BASE_BUILD_PATH,$(HOST_BUILD_DIR),g' $(PKG_BUILD_DIR)/base/unix-aux.mak
	$(SED) 's,OPENWRT_PGK_BUILD_PATH,$(PKG_BUILD_DIR),g' $(PKG_BUILD_DIR)/base/unix-aux.mak
	$(call Build/Compile/Default, cross_prepare)
	$(call Build/Compile/Default)
endef

# Host build should also use system's zlib
define Host/Configure
	(cd $(HOST_BUILD_DIR) && $(RM) -r zlib)
	$(call Host/Configure/Default)
endef

# Patches cannot be applied to the host build
define Host/Patch
endef

# No need to install or patch HOST
define Host/Install
endef

define Package/ghostscript/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(INSTALL_DIR) $(1)/usr/lib/cups/filter
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/lib/cups/filter/* $(1)/usr/lib/cups/filter
	$(INSTALL_DIR) $(1)/usr/share/cups/model
	$(CP) $(PKG_INSTALL_DIR)/usr/share/cups/model/* $(1)/usr/share/cups/model
	$(INSTALL_DIR) $(1)/usr/share/ghostscript/$(PKG_VERSION)/lib
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/ghostscript/$(PKG_VERSION)/lib/* \
		$(1)/usr/share/ghostscript/$(PKG_VERSION)/lib
	$(CP) -r $(PKG_BUILD_DIR)/Resource $(1)/usr/share/ghostscript/$(PKG_VERSION)/
	$(CP) -r $(PKG_BUILD_DIR)/iccprofiles $(1)/usr/share/ghostscript/$(PKG_VERSION)/
	# $(INSTALL_DIR) $(1)/usr/share/ghostscript/$(PKG_VERSION)/examples/cjk
	# $(INSTALL_DATA) $(PKG_INSTALL_DIR)/usr/share/ghostscript/$(PKG_VERSION)/examples/* \
	# 	$(1)/usr/share/ghostscript/$(PKG_VERSION)/examples
	$(INSTALL_DIR) $(1)/etc/cups
	$(INSTALL_DATA) $(PKG_INSTALL_DIR)/etc/cups/gstoraster.convs $(1)/etc/cups
endef

$(eval $(call HostBuild))
$(eval $(call BuildPackage,ghostscript))
