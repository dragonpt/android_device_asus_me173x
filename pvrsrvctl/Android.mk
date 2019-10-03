LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := pvrsrvctl.c
LOCAL_LDFLAGS := -L vendor/asus/me173x/proprietary/vendor/lib
LOCAL_LDLIBS := -lsrv_init -lsrv_um
LOCAL_MODULE_PATH := $(TARGET_OUT)/bin/
LOCAL_MODULE := pvrsrvctl
LOCAL_MODULE_TAGS := optional

include $(BUILD_EXECUTABLE)
