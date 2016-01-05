# Copyright (C) 2011 The Android Open Source Project
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


# function to find all *.cpp files under a directory
define all-cpp-files-under
$(patsubst ./%,%, \
  $(shell cd $(LOCAL_PATH) ; \
          find $(1) -name "*.cpp" -and -not -name ".*") \
 )
endef


HAL_SUFFIX := $(TARGET_DEVICE)
ifeq ($(TARGET_DEVICE),crespo)
	HAL_SUFFIX := herring
endif

LOCAL_PRELINK_MODULE := false
LOCAL_ARM_MODE := arm
LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
LOCAL_ADDITIONAL_DEPENDENCIES := $(LOCAL_PATH)/Android.mk
LOCAL_MODULE := nfc_nci.pn54x.default
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_SRC_FILES := $(call all-c-files-under, .)  $(call all-cpp-files-under, .)
LOCAL_SHARED_LIBRARIES := libhardware_legacy libcutils liblog libdl
LOCAL_MODULE_TAGS := optional

LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/utils \
	$(LOCAL_PATH)/inc \
	$(LOCAL_PATH)/common \
	$(LOCAL_PATH)/dnld \
	$(LOCAL_PATH)/hal \
	$(LOCAL_PATH)/log \
	$(LOCAL_PATH)/tml \
	$(LOCAL_PATH)/self-test


#variables for NFC_NXP_CHIP_TYPE
PN547C2 := 1
PN548C2 := 2
NQ110 := $PN547C2
NQ120 := $PN547C2
NQ210 := $PN548C2
NQ220 := $PN548C2
#NXP PN547 Enable
ifeq ($(PN547C2),1)
LOCAL_CFLAGS += -DPN547C2=1
endif
ifeq ($(PN548C2),2)
LOCAL_CFLAGS += -DPN548C2=2
endif

#### Select the CHIP ####
LOCAL_CFLAGS += -DNFC_NXP_CHIP_TYPE=PN548C2

LOCAL_CFLAGS += -DANDROID \
        -DNXP_UICC_ENABLE -DNXP_HW_SELF_TEST
LOCAL_CFLAGS += -DNFC_NXP_HFO_SETTINGS=FALSE
D_CFLAGS += -DNFC_POWER_MANAGEMENT=FALSE
LOCAL_CFLAGS += $(D_CFLAGS)
#LOCAL_CFLAGS += -DFELICA_CLT_ENABLE
#-DNXP_PN547C1_DOWNLOAD
include $(BUILD_SHARED_LIBRARY)
