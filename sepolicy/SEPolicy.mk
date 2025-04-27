#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_SEPOLICY := hardware/sony/sepolicy

BOARD_VENDOR_SEPOLICY_DIRS += \
    $(LOCAL_SEPOLICY)/vendor

SYSTEM_EXT_PRIVATE_SEPOLICY_DIRS += \
    $(LOCAL_SEPOLICY)/private

SYSTEM_EXT_PUBLIC_SEPOLICY_DIRS += \
    $(LOCAL_SEPOLICY)/public
