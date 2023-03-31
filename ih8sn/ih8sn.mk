#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_IH8SN_CONFIG_FILE ?= $(LOCAL_PATH)/etc/ih8sn.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/etc/60-ih8sn.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/60-ih8sn.sh \
    $(PRODUCT_IH8SN_CONFIG_FILE):$(TARGET_COPY_OUT_SYSTEM)/etc/ih8sn.conf

PRODUCT_PACKAGES += ih8sn
