#
# Copyright (C) 2007 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Base configuration for communication-oriented android devices
# (phones, tablets, etc.).  If you want a change to apply to ALMOST ALL
# devices (including non-phones and non-tablets), modify
# core_minimal.mk instead. If you care about wearables, you need to modify
# core_tiny.mk in addition to core_minimal.mk.

PRODUCT_PACKAGES += \
    BasicDreams \
    Browser \
    Calculator \
    Calendar \
    CalendarProvider \
    CaptivePortalLogin \
    CertInstaller \
    Contacts \
    DeskClock \
    DocumentsUI \
    DownloadProviderUi \
    Email \
    Exchange2 \
    ExternalStorageProvider \
    FusedLocation \
    InputDevices \
    KeyChain \
    Keyguard \
    LatinIME \
    Launcher2 \
    ManagedProvisioning \
    PicoTts \
    PacProcessor \
    libpac \
    PrintSpooler \
    ProxyHandler \
    QuickSearchBox \
    Settings \
    SharedStorageBackup \
    Telecom \
    TeleService \
    VpnDialogs \
    MmsService

# add nfc support by default
PRODUCT_PACKAGES += NfcNci libnfc-nci libnfc_nci
PRODUCT_COPY_FILES += \
         packages/apps/Nfc/migrate_nfc.txt:system/etc/updatecmds/migrate_nfc.txt \
         frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
         frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
         frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
         frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml


$(call inherit-product, $(SRC_TARGET_DIR)/product/core_base.mk)
