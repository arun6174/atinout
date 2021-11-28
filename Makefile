include $(TOPDIR)/rules.mk

PKG_NAME:=atinout
PKG_VERSION:=0.9.1
#PKG_RELEASE:=1

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)


include $(INCLUDE_DIR)/package.mk

define Package/atinout
	SECTION:=net
	CATEGORY:=Network
	TITLE:=atinout
	DEPENDS:=
endef

define Package/atinout/description
	Execute AT commands in sequence and capture the response from the modem.
endef

#TARGET_CFLAGS += -ggdb3

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef


define Package/atinout/install
	$(INSTALL_DIR) $(1)/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/atinout $(1)/bin/
endef


$(eval $(call BuildPackage,atinout))
