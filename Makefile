TARGET := iphone:clang:latest:14.1
INSTALL_TARGET_PROCESSES = SpringBoard


include $(THEOS)/makefiles/common.mk

TWEAK_NAME = notificationtest

notificationtest_FILES = $(shell find Sources/notificationtest -name '*.swift') $(shell find Sources/notificationtestC -name '*.m' -o -name '*.c' -o -name '*.mm' -o -name '*.cpp') Sources/notificationtestC/tweakLegacy.xm
notificationtest_SWIFTFLAGS = -ISources/notificationtestC/include
notificationtest_CFLAGS = -fobjc-arc -ISources/notificationtestC/include

include $(THEOS_MAKE_PATH)/tweak.mk
