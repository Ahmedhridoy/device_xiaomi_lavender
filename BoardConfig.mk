#
# Copyright (C) 2018 The Xiaomi-SDM660 Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

include device/xiaomi/sdm660-common/BoardConfigCommon.mk

# ANXCamera
-include vendor/aeonax/ANXCamera/BoardConfigAnx.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := lavender

# AVB
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2

# Device Path
DEVICE_PATH := device/xiaomi/lavender

# DT2W
TARGET_TAP_TO_WAKE_NODE := "/sys/touchpanel/double_tap"

# Enable System As Root even for non-A/B from P onwards
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOARD_KERNEL_CMDLINE += skip_initramfs rootwait ro init=/init

# Kernel
TARGET_KERNEL_SOURCE := kernel/xiaomi/sdm660
TARGET_KERNEL_CONFIG := lavender-perf_defconfig
TARGET_KERNEL_ADDITIONAL_FLAGS := \
    HOSTCFLAGS="-fuse-ld=lld -Wno-unused-command-line-argument"

# Vendor Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_lavender
TARGET_RECOVERY_DEVICE_MODULES := libinit_lavender

# Manifest
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/manifest.xml

# Platform
BOARD_VENDOR_PLATFORM := xiaomi-sdm660

# Releasetools
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_lavender
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# Vendor Security patch level
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# WLAN MAC
WLAN_MAC_SYMLINK := true

TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop