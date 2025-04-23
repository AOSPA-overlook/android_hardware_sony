#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: Paranoid Android
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := audio_amplifier.cs35l41
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_SRC_FILES := cs35l41.c
LOCAL_VENDOR_MODULE := true
ifeq ($(SOONG_CONFIG_android_hardware_audio_run_64bit), true)
LOCAL_MULTILIB := 64
endif

LOCAL_C_INCLUDES += \
    $(call include-path-for, audio-route) \
    $(call include-path-for, audio-utils) \
    external/tinycompress/include \
    vendor/qcom/opensource/audio-hal/primary-hal/hal/audio_extn \
    vendor/qcom/opensource/audio-hal/primary-hal/hal/msm8974 \
    vendor/qcom/opensource/audio-hal/primary-hal/hal
    $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include \
    $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include/audio \
    $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/techpack/audio/include

LOCAL_ADDITIONAL_DEPENDENCIES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
LOCAL_CFLAGS += -DTA_DEBUG -DDEBUG_SHOW_VALUES -DDEBUG_RUN_ONLY_READ_TA

LOCAL_HEADER_LIBRARIES := \
    qti_kernel_headers \
    libhardware_headers

LOCAL_SHARED_LIBRARIES := \
    audio.primary.$(TARGET_BOARD_PLATFORM) \
    libaudioroute \
    libaudioutils \
    libcutils \
    liblog \
    libtinyalsa \
    libtinycompress

include $(BUILD_SHARED_LIBRARY)
