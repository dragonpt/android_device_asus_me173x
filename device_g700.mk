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

$(call inherit-product-if-exists, vendor/huawei/g700/g700-vendor.mk)

LOCAL_PATH := device/huawei/g700

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay/

# prebuilt kernel modules
MOD_TGT := /system/lib/modules
MOD_SRC := $(LOCAL_PATH)/prebuilt/modules

PRODUCT_COPY_FILES += \
	$(MOD_SRC)/ccci.ko:$(MOD_TGT)/ccci.ko \
	$(MOD_SRC)/ccci_plat.ko:$(MOD_TGT)/ccci_plat.ko \
	$(MOD_SRC)/cifs.ko:$(MOD_TGT)/cifs.ko \
	$(MOD_SRC)/devapc.ko:$(MOD_TGT)/devapc.ko \
	$(MOD_SRC)/devinfo.ko:$(MOD_TGT)/devinfo.ko \
	$(MOD_SRC)/hid-logitech-dj.ko:$(MOD_TGT)/hid-logitech-dj.ko \
	$(MOD_SRC)/md4.ko:$(MOD_TGT)/md4.ko \
	$(MOD_SRC)/mtk_fm_drv.ko:$(MOD_TGT)/mtk_fm_drv.ko \
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
	$(MOD_SRC)/sec.ko:$(MOD_TGT)/sec.ko \
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
    persist.sys.root_access=1 \
	fmradio.driver.chip=3 \
	gps.solution.combo.chip=1 \
	mediatek.wlan.chip=MT6628 \
	mediatek.wlan.ctia=0 \
	mediatek.wlan.module.postfix=_mt6628 \
	persist.mtk.wcn.combo.chipid=0x6628 \
	persist.radio.fd.counter=15 \
	persist.radio.fd.off.counter=5 \
	persist.radio.fd.off.r8.counter=5 \
	persist.radio.fd.r8.counter=15 \
        persist.radio.multisim.config=dsds \
	ril.current.share_modem=2 \
	ril.external.md=0 \
	ril.first.md=1 \
	ril.flightmode.poweroffMD=1 \
	ril.radiooff.poweroffMD=0 \
	ril.specific.sm_cause=0 \
	ril.telephony.mode=1 \
	rild.libpath=/system/lib/mtk-ril.so \
	ro.gemini.smart_3g_switch=1 \
	ro.mediatek.chip_ver=S01 \
	ro.mediatek.gemini_support=true \
	ro.mediatek.platform=MT6589 \
	ro.mediatek.version.branch=ALPS.JB2.MP \
	ro.mediatek.version.release=ALPS.JB2.MP.V1.2 \
	ro.mediatek.version.sdk=1 \
	ro.mediatek.wlan.p2p=1 \
	ro.mediatek.wlan.wsc=1 \
	ro.opengles.version=131072 \
	ro.sf.lcd_density=320 \
	ro.telephony.ril_class=MediaTekRIL \
    ro.telephony.ril.config=fakeiccid \
	wifi.direct.interface=p2p0 \
	wifi.interface=wlan0 \
	wifi.tethering.interface=ap0

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	gsm0710muxd

# audio
PRODUCT_PACKAGES += \
    libaudio.primary.default \
    audio_policy.mt6589 \
    audio.primary.mt6589 \
    audio.r_submix.default \
    audio.a2dp.default \
    audio.usb.default \
    audio_policy.default \
    audio_policy.stub \
    libblisrc \
    libdpframework \
    libaudiosetting \
    libvcodecdrv \
    libstagefright_memutil \
    libcustom_prop \
    libnvram \
    libaudiocustparam \
    libaudiocompensationfilter \
    libcvsd_mtk \
    libmsbc_mtk \
    libaed \
    libaudiocomponentengine \
    libaudiodcrflt \
    libbluetoothdrv \
    libspeech_enh_lib 

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf
    
# FM Radio
PRODUCT_PACKAGES += \
    FMRadio \
    libfmjni \
    libfmmt6628 \
    libfmcust \
    libmtkplayer

# Media
   
PRODUCT_COPY_FILES += \
        frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
        frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
        frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
	$(LOCAL_PATH)/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/media_profiles.xml:system/etc/media_profiles.xml

# Wifi
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
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml
    
# Lights
#PRODUCT_PACKAGES += \
#    lights.mt6589

# Torch    
PRODUCT_PACKAGES += Torch

# Charger
PRODUCT_PACKAGES += \
    libhealthd.mtk \
    charger \
    charger_res_images \
    libnl_2 \
    libtinyxml
    
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.media.use-awesome=true

# GPU
PRODUCT_PACKAGES += \
    pvrsrvctl
    
# libcorkscrew is needed for some of the PVR stuff.
PRODUCT_PACKAGES += \
	libcorkscrew
	
# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# AAPT
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

