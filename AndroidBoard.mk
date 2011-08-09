LOCAL_PATH := $(call my-dir)

file := $(TARGET_ROOT_OUT)/init.rc
ALL_PREBUILT += $(file)
$(file) : $(LOCAL_PATH)/init.rc | $(ACP)
$(transform-prebuilt-to-target)


# include the non-open-source counterpart to this file
-include vendor/samsung/indulge/AndroidBoardVendor.mk


