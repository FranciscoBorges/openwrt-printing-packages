include $(TOPDIR)/rules.mk

PKG_NAME:=splix
PKG_VERSION:=2.0.1.20130902svn
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/splix
PKG_SOURCE:=splix-$(PKG_VERSION).tar.bz2
PKG_SOURCE_URL:=https://pkgs.fedoraproject.org/repo/pkgs/splix/splix-2.0.1.20130902svn.tar.bz2/2901e9482dd1a7c44f7b730696868e09
PKG_MD5SUM:=2901e9482dd1a7c44f7b730696868e09
PKG_CAT:=bzcat
PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk

define Package/splix
	SECTION:=net
	CATEGORY:=Network
	TITLE:=SPL printer driver for Unix
	#DESCRIPTION:=This variable is obsolete. use the Package/name/description define instead!
	DEPENDS:=+cups +libcupsimage +libtiff +libjbigkit
	URL:=http://pkgs.fedoraproject.org/cgit/splix.git/
endef

define Package/splix/description
	Splix is a driver for printers that speak SPL (Samsung Printer Language). This includes printers made by Samsung, Dell, and Xerox
endef

define Build/Configure
	$(SED) 's/(const PPDFile::Value::Value/(const PPDFile::Value/' $(PKG_BUILD_DIR)/src/ppdfile.cpp
	$(SED) "s/^CC\t\t:= gcc/CC\t\t:= $(TARGET_CC)/" -e "s/^CXX\t\t:= g++/CXX\t\t:= $(TARGET_CXX)/" -e "s/^AR\t\t:= ar/AR\t\t:= $(TARGET_AR)/" $(PKG_BUILD_DIR)/Makefile
	$(SED) 's|\(.*\)toqpdl_LDFLAGS\t*:=.*|\1toqpdl_LDFLAGS\t:=$(TARGET_LDFLAGS) -lpthread|' -e 's|\(.*\)toqpdl_LIBS\t*:=.*|\1toqpdl_LIBS\t:=-lpng -ltiff -lcups -lcupsimage|' -e 's|^CXXFLAGS\t\t+= `cups.*|CXXFLAGS\t\t+= $(TARGET_CFLAGS) -Iinclude -Wall $(TARGET_CPPFLAGS)|' -e 's|CUPSFILTER\t*:=.*|CUPSFILTER\t:= /usr/lib/cups/filter|' -e 's|CUPSPPD\t*:=.*|CUPSPPD\t:= /usr/share/cups/model|' $(PKG_BUILD_DIR)/module.mk
	$(SED) 's|g++|$(TARGET_CXX)|' $(PKG_BUILD_DIR)/rules.mk
	mv $(PKG_BUILD_DIR)/*.ppd $(PKG_BUILD_DIR)/ppd/
endef

$(eval $(call BuildPackage,splix))
