#
# Copyright (C) 2010-2011 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

PKG_NAME:=custom-settings
PKG_VERSION:=1
PKG_RELEASE:=23
PKG_ARCH:=all
PKG_LICENSE:=GPLv3

PKG_BUILD_DIR := $(BUILD_DIR)/$(PKG_NAME)
include $(INCLUDE_DIR)/package.mk



define Package/custom-settings
  TITLE:=Add custom settings as default.
  MAINTAINER:=retrochet
  PKGARCH:=all
  DEPENDS:=+@LUCI_LANG_zh-cn
endef

define Package/automount/description
Add custom settings as default.
endef

define Build/Compile
endef

define Package/automount/install
	$(INSTALL_DIR) $(1)/etc/uci-defaults
	$(INSTALL_BIN) ./files/zzz-default-settings $(1)/etc/uci-defaults/99-default-settings
endef

$(eval $(call BuildPackage,custom-settings))