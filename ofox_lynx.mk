#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from lynx device
$(call inherit-product, device/google/lynx/device.mk)

DEVICE_USES_NO_TRUSTY := true
USE_SWIFTSHADER := true
BOARD_USES_SWIFTSHADER := true

PRODUCT_DEVICE := lynx
PRODUCT_NAME := ofox_lynx
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel 7a
PRODUCT_MANUFACTURER := google

