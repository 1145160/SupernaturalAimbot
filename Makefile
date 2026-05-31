export TARGET = iphone:clang:latest:14.0
export ARCHS = arm64
export TARGET_IPHONEOS_DEPLOYMENT_VERSION = 14.0

INSTALL_TARGET_PROCESSES = 超自然行动组

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = Xyaim
Xyaim_FILES = Xyaim.xm
Xyaim_CFLAGS = -fobjc-arc -Wno-arc-performSelector-leaks

# 无根越狱专用
ifeq ($(shell echo $(THEOS_PACKAGE_SCHEME) | grep rootless),)
Xyaim_CFLAGS += -DROOTLESS=0
else
Xyaim_CFLAGS += -DROOTLESS=1
endif

include $(THEOS)/makefiles/tweak.mk
