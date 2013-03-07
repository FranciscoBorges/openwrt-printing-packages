#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=ubuntu-font-family
PKG_VERSION:=0.80
PKG_RELEASE:=1
PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).zip
PKG_SOURCE_URL:=http://font.ubuntu.com/download/
PKG_MD5SUM:=a1fc70f5a5b1d096ab8310886cddaa1c

include $(INCLUDE_DIR)/package.mk

define Package/ubuntu-fonts
  SECTION:=fonts
  CATEGORY:=Network
  TITLE:=ubuntu-fonts
  SUBMENU:=Printing
  DEPENDS:= +fontconfig
endef

define Package/ubuntu-fonts/description
The Ubuntu typeface has been specially created to complement the Ubuntu tone of
voice. It has a contemporary style and contains characteristics unique to the
Ubuntu brand that convey a precise, reliable and free attitude.
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/ubuntu-fonts/install
	$(INSTALL_DIR) $(1)/usr/share/fonts/ubuntu
	$(CP) $(PKG_BUILD_DIR)/*.ttf $(1)/usr/share/fonts/ubuntu
endef

define Package/ubuntu-fonts/postinst
#!/bin/sh
/usr/bin/fc-cache --force --verbose
endef

$(eval $(call BuildPackage,ubuntu-fonts))
