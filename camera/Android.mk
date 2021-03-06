#
# RockChip Camera HAL 
#
LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES:=\
	CameraHal_Module.cpp\
	CameraHal.cpp\
	CameraHal_Utils.cpp\
	MessageQueue.cpp\
	CameraHal_Mem.cpp\
  
ifeq ($(strip $(TARGET_BOARD_HARDWARE)),rk30board)	 
LOCAL_C_INCLUDES += \
	frameworks/base/include/ui \
  external/jpeg \
  external/jhead\
  hardware/rockchip/hwcomposer_rga\
	hardware/rockchip/libgralloc_ump/ump/include\
	hardware/rockchip/libon2

LOCAL_SHARED_LIBRARIES:= \
    libui \
    libbinder \
    libutils \
    libcutils \
    libcamera_client \
    libgui\
    libjpeg\
    libjpeghwenc\
    libion\
    libvpu\
    libdl

endif
ifeq ($(strip $(TARGET_BOARD_HARDWARE)),rockchip28board)
LOCAL_C_INCLUDES += \
    frameworks/base/include/ui \
  external/jpeg \
  external/jhead\
  hardware/rockchip/hwcomposer_rga\
  hardware/rockchip/libon2\
  hardware/rockchip/libgralloc_ump/ump/include

LOCAL_SHARED_LIBRARIES:= \
    libui \
    libbinder \
    libutils \
    libcutils \
    libcamera_client \
    libgui\
    libjpeg\
    libjpeghwenc\
    libyuvtorgb\
    libion\
    libvpu\
    libdl

endif
ifeq ($(strip $(TARGET_BOARD_HARDWARE)),rockchipboard)    
LOCAL_C_INCLUDES += \
	#frameworks/base/include/ui \
  frameworks/native/include/media/hardware \
  frameworks/native/include/media/openmax \
  external/jpeg \
  external/jhead	
  
LOCAL_SHARED_LIBRARIES:= \
    libui \
    libbinder \
    libutils \
    libcutils \
    libcamera_client \
    libgui\
    libjpeghwenc\
    libjpeg\
    libyuvtorgb
endif


LOCAL_CFLAGS := -fno-short-enums -DCOPY_IMAGE_BUFFER
ifeq ($(strip $(TARGET_BOARD_HARDWARE)),rk30board)	
LOCAL_CFLAGS += -DTARGET_RK30
endif

ifeq ($(strip $(TARGET_BOARD_HARDWARE)),rockchip28board)
LOCAL_CFLAGS += -DTARGET_RK30
endif

ifeq ($(strip $(TARGET_BOARD_HARDWARE)),rockchipboard) 
LOCAL_CFLAGS += -DTARGET_rockchip
endif

ifeq ($(strip $(TARGET_BOARD_PLATFORM)),rk3188)
LOCAL_CFLAGS += -DTARGET_BOARD_PLATFORM_RK30XX
endif

ifeq ($(strip $(TARGET_BOARD_PLATFORM)),rk3026)
LOCAL_CFLAGS += -DTARGET_BOARD_PLATFORM_RK30XX
endif

ifeq ($(strip $(TARGET_BOARD_PLATFORM)),rk30xx)
LOCAL_CFLAGS += -DTARGET_BOARD_PLATFORM_RK30XX
endif

ifeq ($(strip $(TARGET_BOARD_PLATFORM)),rockchip28)
LOCAL_CFLAGS += -DTARGET_BOARD_PLATFORM_rockchip28
endif

ifeq ($(strip $(TARGET_BOARD_PLATFORM)),rk30xxb)	
LOCAL_CFLAGS += -DTARGET_BOARD_PLATFORM_RK30XXB
endif

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_MODULE:=camera.$(TARGET_BOARD_HARDWARE)

LOCAL_MODULE_TAGS:= optional
include $(BUILD_SHARED_LIBRARY)
