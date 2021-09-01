LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    mtkshim_xlog.cpp \
    mtkshim_ui.cpp

LOCAL_SHARED_LIBRARIES := libbinder liblog libui
LOCAL_MODULE := libmtkshim
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
