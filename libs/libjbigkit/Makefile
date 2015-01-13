include $(TOPDIR)/rules.mk

PKG_NAME:=libjbigkit
PKG_VERSION:=2.1
PKG_RELEASE:=1

PKG_BUILD_DIR:=$(BUILD_DIR)/jbigkit-$(PKG_VERSION)
PKG_SOURCE:=jbigkit-$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:=http://www.cl.cam.ac.uk/~mgk25/jbigkit/download
PKG_MD5SUM:=ebcf09bed9f14d7fa188d3bd57349522
PKG_CAT:=zcat

include $(INCLUDE_DIR)/package.mk

define Package/libjbigkit
	SECTION:=libs
	CATEGORY:=Libraries
	TITLE:=JBIG-KIT library
	#DESCRIPTION:=This variable is obsolete. use the Package/name/description define instead!
	DEPENDS:=
	URL:=http://freecode.com/projects/jbigkit/
endef

define Package/libjbigkit/description
	JBIG-KIT implements a highly effective data compression algorithm for bi-level high-resolution images such as fax pages or scanned documents. This package provides JBIG-KIT C libraries of compression and decompression functions
endef

define Build/Compile
	cd $(PKG_BUILD_DIR)/libjbig; PATH=$(TARGET_PATH) $(TARGET_CC) -fPIC -g -c $(TARGET_CFLAGS) -ansi -pedantic jbig.c
	cd $(PKG_BUILD_DIR)/libjbig; PATH=$(TARGET_PATH) $(TARGET_CC) -fPIC -g -c $(TARGET_CFLAGS) -ansi -pedantic jbig85.c
	cd $(PKG_BUILD_DIR)/libjbig; PATH=$(TARGET_PATH) $(TARGET_CC) -fPIC -g -c $(TARGET_CFLAGS) -ansi -pedantic jbig_ar.c
	cd $(PKG_BUILD_DIR)/libjbig; PATH=$(TARGET_PATH) $(TARGET_CC) -shared -o libjbig.so jbig.o jbig_ar.o $(TARGET_LDLAGS)
	cd $(PKG_BUILD_DIR)/libjbig; PATH=$(TARGET_PATH) $(TARGET_CC) -shared -o libjbig85.so jbig85.o jbig_ar.o $(TARGET_LDLAGS)
endef

define Build/Install
	$(CP) $(PKG_BUILD_DIR)/libjbig/*.so $(STAGING_DIR)/usr/lib/
	$(CP) $(PKG_BUILD_DIR)/libjbig/*.h $(STAGING_DIR)/usr/include/
endef

define Package/libjbigkit/install
	$(INSTALL_DIR) $(1)/usr/lib
	$(CP) $(PKG_BUILD_DIR)/libjbig/*.so $(1)/usr/lib/
endef

$(eval $(call BuildPackage,libjbigkit))
