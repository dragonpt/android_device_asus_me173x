#Cause build system is so awesome ... /irony
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE := Clean_useless
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_OVERRIDES_PACKAGES := CallLogBackup \
                            CarrierConfig \
                            CMUpdater \
                            Contacts \
                            ContactsProvider \
                            Dialer \
                            MmsService \
                            Telecom \
                            TelephonyProvider \
                            AudioFX
#superdragonpt TODO may remove in the future
# Screencast/ SoundRecorder /CMFileManager /PrintSpooler
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_CERTIFICATE := PRESIGNED

include $(BUILD_PREBUILT)
