# Copyright (C) 2017 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_FOLDER := device/asus/me173x
TARGET_SPECIFIC_HEADER_PATH := device/asus/me173x/include
-include vendor/asus/me173x/BoardConfigVendor.mk

# board
TARGET_BOARD_PLATFORM := mt6589
TARGET_ARCH := arm
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_MEMCPY_OPT_DISABLE := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := mt6589

# blob hacks
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_NEEDS_NON_PIE_SUPPORT := true
BOARD_USES_LEGACY_MTK_AV_BLOB := true
USE_LEGACY_AUDIO_POLICY := 0

# HW Composer
BOARD_NEEDS_OLD_HWC_API := true
COMMON_GLOBAL_CFLAGS += -DMTK_G_MT6589 -DMTK_HARDWARE -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL -DREFBASE_JB_MR1_COMPAT_SYMBOLS
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true
#BOARD_HAVE_PIXEL_FORMAT_INFO :=true
BOARD_EGL_WORKAROUND_BUG_10194508 := true

#MTK DEFINITIONS
HAVE_XLOG_FEATURE := yes
MTK_FM_SUPPORT := yes
MTK_ION_SUPPORT := yes
MTK_HWC_SUPPORT := yes
MTK_DP_FRAMEWORK := yes
MTK_HWC_VERSION := 1.0
MTK_ROOT := mediatek
MTK_PLATFORM := MT6589

#Video and codec
#COMMON_GLOBAL_CFLAGS += -DMTK_VIDEO_HEVC_SUPPORT
#COMMON_GLOBAL_CPPFLAGS += -DMTK_VIDEO_HEVC_SUPPORT
BOARD_USES_6575_MFV_HW := true
USES_MTK_OMX_CORE := true
USES_CACHE_PMEM := true
BOARD_USES_6575_HW := true
BOARD_USES_MTK_JPEG_HW_DECODER := true
BOARD_USES_MTK_VPX_DEC := true
#mfg
MFG_ENABLE_GRALLOC_PMEM := true
BOARD_ENABLE_MFG_HARDWARE := true
MFG_HALCOMPOSITION_BYPASS := false
#lcd hw
BOARD_USES_YUSU_LCD_HW_OVERLAY := true
BOARD_USES_ARGB8888_FB := true

# BT
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/asus/me173x/bluetooth

# Healthd & Charging
HEALTHD_ENABLE_TRICOLOR_LED := true
RED_LED_PATH := /sys/class/leds/red/brightness
GREEN_LED_PATH := /sys/class/leds/green/brightness
BLUE_LED_PATH := /sys/class/leds/blue/brightness
# Next lines, fix charging-mod in power off. It needs to modify the init.cpp, too.
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/BOOT/BOOT/boot/boot_mode
BOARD_CHARGER_DISABLE_INIT_BLANK := true
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
BOARD_HAL_STATIC_LIBRARIES := libhealthd.mtk
BOARD_HEALTHD_CUSTOM_CHARGER_RES := $(DEVICE_FOLDER)/charger/images

# power
TARGET_POWERHAL_VARIANT := cm

# boot
TARGET_NO_BOOTLOADER := true
BOARD_MKBOOTIMG_ARGS := --board 1336460062
BOARD_CUSTOM_BOOTIMG := true

# Offline charging
ADDITIONAL_DEFAULT_PROPERTIES += ro.mount.fs=EXT4

# EGL settings
BOARD_EGL_CFG := device/asus/me173x/configs/egl.cfg
USE_OPENGL_RENDERER := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true

# kernel
TARGET_PREBUILT_KERNEL := $(DEVICE_FOLDER)/prebuilt/kernel

# partition info
BOARD_BOOTIMAGE_PARTITION_SIZE := 6291456
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1611661312
BOARD_USERDATAIMAGE_PARTITION_SIZE:= 4830789632
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
#BOARD_RECOVERYIMAGE_PARTITION_SIZE := 6291456
BOARD_KERNEL_PAGESIZE := 2048
BOARD_FLASH_BLOCK_SIZE := 512
TARGET_USERIMAGES_USE_EXT4 := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_FOLDER)/root/fstab.mt6589
TARGET_PREBUILT_RECOVERY_KERNEL := $(DEVICE_FOLDER)/recovery/kernel
BOARD_HAS_NO_SELECT_BUTTON := true

# mkimage to append headers
TARGET_MKIMAGE := device/asus/me173x/mkimage
TARGET_USE_BUILT_BOOTIMAGE := true
#TARGET_USE_BUILT_RECOVERYIMAGE := true
BOARD_CUSTOM_BOOTIMG_MK := device/asus/me173x/boot.mk

# wifi
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_WLAN_DEVICE := mediatek
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM:="/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA:="STA"
WIFI_DRIVER_FW_PATH_AP:="AP"
WIFI_DRIVER_FW_PATH_P2P:="P2P"

TARGET_SPECIFIC_HEADER_PATH := device/asus/me173x/include

# allow more than one lun file
TARGET_USE_CUSTOM_LUN_FILE_PATH := "/sys/devices/virtual/android_usb/android0/f_mass_storage/lun%d/file"

#SEPolicy
BOARD_SEPOLICY_DIRS += \
    device/asus/me173x/sepolicy

BOARD_SEPOLICY_UNION += \
    file_contexts \
    device.te \
    netd.te \
    app.te \
    bootanimation.te \
    pvrsrvctl.te \
    surfaceflinger.te \
    system.te

DEVICE_RESOLUTION := 720x1280

BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true

TW_NO_USB_STORAGE := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TW_NO_REBOOT_BOOTLOADER := true
TW_BRIGHTNESS_PATH := /sys/devices/platform/leds-mt65xx/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_CUSTOM_BATTERY_PATH := /sys/devices/platform/mt6320-battery/power_supply/battery

TW_INTERNAL_STORAGE_PATH := "/sdcard"
TW_INTERNAL_STORAGE_MOUNT_POINT := "sdcard"
TW_EXTERNAL_STORAGE_PATH := "/external_sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sdcard"
TARGET_RECOVERY_FSTAB := $(DEVICE_FOLDER)/root/recovery.fstab

