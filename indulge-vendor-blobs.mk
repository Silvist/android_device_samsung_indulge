# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Camera
PRODUCT_COPY_FILES += \
vendor/samsung/common/aries/proprietary/libcamera.so:obj/lib/libcamera.so \
vendor/samsung/common/aries/proprietary/libcamera.so:system/lib/libcamera.so \
vendor/samsung/common/aries/proprietary/libcamera_client.so:system/lib/libcamera.so \
vendor/samsung/common/aries/proprietary/libActionShot.so:system/lib/libActionShot.so \
vendor/samsung/common/aries/proprietary/libCaMotion.so:system/lib/libCaMotion.so \
vendor/samsung/common/aries/proprietary/libcaps.so:system/lib/libcaps.so \
vendor/samsung/common/aries/proprietary/libPanoraMax1.so:system/lib/libPanoraMax1.so \
vendor/samsung/common/aries/proprietary/libPlusMe.so:system/lib/libPlusMe.so \
vendor/samsung/common/aries/proprietary/libarccamera.so:system/lib/libarccamera.so \
vendor/samsung/common/aries/proprietary/libcamerafirmwarejni.so:system/lib/libcamerafirmwarejni.so \
vendor/samsung/common/aries/proprietary/libcameraservice.so:system/lib/libcameraservice.so \
vendor/samsung/common/aries/proprietary/libseccamera.so:system/lib/libseccamera.so \
vendor/samsung/common/aries/proprietary/libseccameraadaptor.so:system/lib/libseccameraadaptor.so \
vendor/samsung/common/aries/proprietary/datapattern_420sp.yuv:system/cameradata/datapattern_420sp.yuv \
vendor/samsung/common/aries/proprietary/datapattern_front_420sp.yuv:system/cameradata/datapattern_front_420sp.yuv \

# WiFi & Bluetooth
PRODUCT_COPY_FILES += \
vendor/samsung/indulge/proprietary/etc/wifi/nvram_net.txt:system/etc/wifi/nvram_net.txt \
vendor/samsung/indulge/proprietary/etc/wifi/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \
vendor/samsung/indulge/proprietary/etc/wifi/bcm4329_aps.bin:system/etc/wifi/bcm4329_aps.bin \
vendor/samsung/indulge/proprietary/etc/wifi/bcm4329_mfg.bin:system/etc/wifi/bcm4329_mfg.bin \
vendor/samsung/indulge/proprietary/etc/wifi/bcm4329_sta.bin:system/etc/wifi/bcm4329_sta.bin \
vendor/samsung/indulge/proprietary/bin/BCM4329B1_002.002.023.0417.0430.hcd:system/bin/BCM4329B1_002.002.023.0417.0430.hcd \

#GPS
PRODUCT_COPY_FILES += \
vendor/samsung/indulge/proprietary/lib/libgps.so:system/lib/libgps.so \
vendor/samsung/indulge/proprietary/lib/libsecgps.so:system/lib/libsecgps.so \


# Firmware files
PRODUCT_COPY_FILES += \
vendor/samsung/indulge/proprietary/seh/CE147F00.bin:system/firmware/CE147F00.bin \
vendor/samsung/indulge/proprietary/seh/CE147F01.bin:system/firmware/CE147F01.bin \
vendor/samsung/indulge/proprietary/seh/CE147F02.bin:system/firmware/CE147F02.bin \
vendor/samsung/indulge/proprietary/seh/CE147F03.bin:system/firmware/CE147F03.bin

# Display (3D)
PRODUCT_COPY_FILES += \
vendor/samsung/indulge/proprietary/lib/egl/libEGL_POWERVR_SGX540_120.so:system/lib/egl/libEGL_POWERVR_SGX540_120.so \
vendor/samsung/indulge/proprietary/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \
vendor/samsung/indulge/proprietary/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so:system/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \
vendor/samsung/indulge/proprietary/lib/egl/libGLESv2_POWERVR_SGX540_120.so:system/lib/egl/libGLESv2_POWERVR_SGX540_120.so \
vendor/samsung/indulge/proprietary/lib/libIMGegl.so:system/lib/libIMGegl.so \
vendor/samsung/indulge/proprietary/lib/libpvr2d.so:system/lib/libpvr2d.so \
vendor/samsung/indulge/proprietary/lib/libsrv_init.so:system/lib/libsrv_init.so \
vendor/samsung/indulge/proprietary/lib/libsrv_um.so:system/lib/libsrv_um.so \
vendor/samsung/indulge/proprietary/lib/libPVRScopeServices.so:system/lib/libPVRScopeServices.so \
vendor/samsung/indulge/proprietary/lib/libglslcompiler.so:system/lib/libglslcompiler.so \
vendor/samsung/indulge/proprietary/lib/libpvrANDROID_WSEGL.so:system/lib/libpvrANDROID_WSEGL.so \
vendor/samsung/indulge/proprietary/bin/pvrsrvinit:system/bin/pvrsrvinit

# Sensors, Lights etc
PRODUCT_COPY_FILES += \
vendor/samsung/indulge/proprietary/lib/hw/gralloc.s5pc110.so:system/lib/hw/gralloc.s5pc110.so \
vendor/samsung/indulge/proprietary/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so

# RIL
PRODUCT_COPY_FILES += \
vendor/samsung/indulge/proprietary/lib/libril.so:system/lib/libril.so \
vendor/samsung/indulge/proprietary/lib/libsec-ril40.so:system/lib/libsec-ril40.so \
vendor/samsung/indulge/proprietary/lib/libsecril-client.so:system/lib/libsecril-client.so

# PPP
PRODUCT_COPY_FILES += \
vendor/samsung/indulge/proprietary/bin/pppd_runner:system/bin/pppd_runner

#Sensors
PRODUCT_COPY_FILES += \
vendor/samsung/indulge/proprietary/lib/libsensor_yamaha.so:system/lib/libsensor_yamaha.so \
vendor/samsung/indulge/proprietary/lib/libsensor_yamaha_test.so:system/lib/libsensor_yamaha_test.so \
vendor/samsung/indulge/proprietary/lib/libms3c_yamaha.so:system/lib/libms3c_yamaha.so \
vendor/samsung/indulge/proprietary/bin/sensorserver_yamaha:system/bin/sensorserver_yamaha \
vendor/samsung/indulge/proprietary/bin/sensorcalibutil_yamaha:system/bin/sensorcalibutil_yamaha \
vendor/samsung/indulge/proprietary/bin/sensorstatutil_yamaha:system/bin/sensorstatutil_yamaha


# Misc
PRODUCT_COPY_FILES += \
vendor/samsung/indulge/proprietary/bin/immvibed:system/bin/immvibed \
vendor/samsung/indulge/proprietary/bin/logwrapper:system/bin/logwrapper \
vendor/samsung/indulge/proprietary/bin/immvibed:system/bin/immvibed \
vendor/samsung/indulge/proprietary/bin/killmediaserver:system/bin/killmediaserver \
vendor/samsung/indulge/proprietary/bin/notified_event:system/bin/notified_event \
vendor/samsung/indulge/proprietary/bin/mfgloader:system/bin/mfgloader \
vendor/samsung/indulge/proprietary/bin/netcfg:system/bin/netcfg \
vendor/samsung/indulge/proprietary/bin/wlservice:system/bin/wlservice \
vendor/samsung/indulge/proprietary/lib/libnetutils.so:system/lib/libnetutils.so

# LPM charging files.
PRODUCT_COPY_FILES += \
vendor/samsung/indulge/proprietary/bin/playlpm:system/bin/playlpm \
vendor/samsung/indulge/proprietary/bin/charging_mode:system/bin/charging_mode \
vendor/samsung/indulge/proprietary/lib/libQmageDecoder.so:system/lib/libQmageDecoder.so \
vendor/samsung/indulge/proprietary/media/battery_charging_*.qmg:system/media/battery_charging_*.qmg \
vendor/samsung/indulge/proprietary/media/chargingwarning.qmg:system/media/chargingwarning.qmg \
vendor/samsung/indulge/proprietary/media/Disconnected.qmg:system/media/Disconnected.qmg

