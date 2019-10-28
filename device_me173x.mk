# Copyright (C) 2013 The Android Open Source Project
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

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/asus/me173x/me173x-vendor.mk)

LOCAL_PATH := device/asus/me173x

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay/

# Kernel
# atm prebuilt TODO inline compile
MOD_TGT := /system/lib/modules
MOD_SRC := $(LOCAL_PATH)/prebuilt/modules

PRODUCT_COPY_FILES += \
	$(MOD_SRC)/devapc.ko:$(MOD_TGT)/devapc.ko \
	$(MOD_SRC)/devinfo.ko:$(MOD_TGT)/devinfo.ko \
	$(MOD_SRC)/hid-logitech-dj.ko:$(MOD_TGT)/hid-logitech-dj.ko \
	$(MOD_SRC)/mtk_hif_sdio.ko:$(MOD_TGT)/mtk_hif_sdio.ko \
	$(MOD_SRC)/mtk_stp_bt.ko:$(MOD_TGT)/mtk_stp_bt.ko \
	$(MOD_SRC)/mtk_stp_gps.ko:$(MOD_TGT)/mtk_stp_gps.ko \
	$(MOD_SRC)/mtk_stp_uart.ko:$(MOD_TGT)/mtk_stp_uart.ko \
	$(MOD_SRC)/mtk_stp_wmt.ko:$(MOD_TGT)/mtk_stp_wmt.ko \
	$(MOD_SRC)/mtk_wmt_wifi.ko:$(MOD_TGT)/mtk_wmt_wifi.ko \
	$(MOD_SRC)/mtklfb.ko:$(MOD_TGT)/mtklfb.ko \
	$(MOD_SRC)/pvrsrvkm.ko:$(MOD_TGT)/pvrsrvkm.ko \
	$(MOD_SRC)/scsi_tgt.ko:$(MOD_TGT)/scsi_tgt.ko \
	$(MOD_SRC)/scsi_wait_scan.ko:$(MOD_TGT)/scsi_wait_scan.ko \
	$(MOD_SRC)/vcodec_kernel_driver.ko:$(MOD_TGT)/vcodec_kernel_driver.ko \
	$(MOD_SRC)/wlan_mt6628.ko:$(MOD_TGT)/wlan_mt6628.ko

# Set default USB interface
PRODUCT_PROPERTY_OVERRIDES += \
        persist.sys.usb.config=mtp,adb \
        ro.allow.mock.location=0 \
        ro.debuggable=1 \
        persist.service.adb.enable=1 \
        persist.service.debuggable=1 \
        ro.secure=0 \
        ro.adb.secure=0

PRODUCT_PROPERTY_OVERRIDES := \
    service.adb.root=1 \
    persist.sys.root_access=1

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

# Media 
PRODUCT_COPY_FILES += \
        frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
        frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
        frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
	$(LOCAL_PATH)/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml

# WiFi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf
   
    
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    $(LOCAL_PATH)/configs/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/configs/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
        $(LOCAL_PATH)/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
        $(LOCAL_PATH)/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl \

# Thermal
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/configs/thermal.conf:system/etc/.tp/thermal.conf \
     $(LOCAL_PATH)/configs/.ht120.mtc:system/etc/.tp/.ht120.mtc \
     $(LOCAL_PATH)/configs/thermal.off.conf:system/etc/.tp/thermal.off.conf

# GPS
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/configs/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml
     
PRODUCT_PACKAGES += \
    libxlog

# Ramdisk
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/root/fstab.mt6589:root/fstab.mt6589 \
	$(LOCAL_PATH)/root/ueventd.mt6589.rc:root/ueventd.mt6589.rc \
	$(LOCAL_PATH)/root/init.mt6589.rc:root/init.mt6589.rc \
	$(LOCAL_PATH)/root/init.modem.rc:root/init.modem.rc \
	$(LOCAL_PATH)/root/init.protect.rc:root/init.protect.rc \
	$(LOCAL_PATH)/root/init.mt6589.usb.rc:/root/init.mt6589.usb.rc

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml


# Charger
PRODUCT_PACKAGES += \
    libhealthd.mtk \
    charger \
    charger_res_images \
    libnl_2 \
    libtinyxml
    
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.media.use-awesome=true

# GPU PVR
PRODUCT_PACKAGES += \
    pvrsrvctl
    
# libcorkscrew
PRODUCT_PACKAGES += \
	libcorkscrew
	
# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 800

# AAPT

# Use high-density artwork where available
PRODUCT_LOCALES += hdpi

# this is an large screen (TAB)
PRODUCT_AAPT_CONFIG := large hdpi

$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)

