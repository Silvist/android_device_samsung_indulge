#!/bin/sh

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

DEVICE=epic
if [ "$1" = "adb" ]
then
echo "Using ADB pull to extract files."
cmd="adb"

elif [ "$1" = "cp" ]
then

if [ $# -lt 2 ]
then
echo "Cannot use copy operation without a path! Path should lead to the base directory of a ROM. ex. /home/user/somerom/"
exit
else
echo "Using copy operation to extract files."
cmd="cp"
fi

else
echo "Invalid syntax. Script must be called with the following parameters..."
echo "./extract-files.sh adb : This will pull files from your device using ADB."
echo "./extract-files.sh cp /path/to/ROM : This will copy files from a directory."
exit

fi
rm -rf ../../../vendor/samsung/$DEVICE/proprietary
mkdir -p ../../../vendor/samsung/$DEVICE/proprietary

DIRS="
etc/ppp
etc/wifi
lib/egl
lib/hw
media
seh
cameradata
bin
"

for DIR in $DIRS; do
mkdir -p ../../../vendor/samsung/$DEVICE/proprietary/$DIR
done

FILES="
etc/wifi/nvram_net.txt
etc/wifi/nvram_mfg.txt
etc/wifi/bcm4329_aps.bin
etc/wifi/bcm4329_mfg.bin
etc/wifi/bcm4329_sta.bin
etc/wifi/wpa_supplicant.conf
bin/BCM4329B1_002.002.023.0417.0430.hcd
seh/CE147F00.bin
seh/CE147F01.bin
seh/CE147F02.bin
seh/CE147F03.bin
lib/egl/libEGL_POWERVR_SGX540_120.so
lib/egl/libGLES_android.so
lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so
lib/egl/libGLESv2_POWERVR_SGX540_120.so
lib/libIMGegl.so
lib/libpvr2d.so
lib/libsrv_init.so
lib/libsrv_um.so
lib/libPVRScopeServices.so
lib/libglslcompiler.so
lib/libpvrANDROID_WSEGL.so
lib/libQmageDecoder.so
bin/pvrsrvinit
lib/hw/copybit.s5pc110.so
lib/hw/lights.s5pc110.so
lib/hw/gralloc.s5pc110.so
lib/hw/sensors.default.so
cameradata/datapattern_420sp.yuv
cameradata/datapattern_front_420sp.yuv
lib/libril.so
lib/libsec-ril40.so
lib/libsecril-client.so
lib/libgps.so
lib/libsecgps.so
lib/libsensor_yamaha.so
lib/libsensor_yamaha_test.so
lib/libms3c_yamaha.so
bin/sensorserver_yamaha
bin/sensorcalibutil_yamaha
bin/sensorstatutil_yamaha
bin/immvibed
bin/logwrapper
bin/immvibed
bin/killmediaserver
bin/notified_event
lib/libnetutils.so
bin/mfgloader
bin/wlservice
bin/netcfg
bin/pppd_runner
bin/playlpm
bin/charging_mode
media/battery_charging_5.qmg
media/battery_charging_10.qmg
media/battery_charging_15.qmg
media/battery_charging_20.qmg
media/battery_charging_25.qmg
media/battery_charging_30.qmg
media/battery_charging_35.qmg
media/battery_charging_40.qmg
media/battery_charging_45.qmg
media/battery_charging_50.qmg
media/battery_charging_55.qmg
media/battery_charging_60.qmg
media/battery_charging_65.qmg
media/battery_charging_70.qmg
media/battery_charging_75.qmg
media/battery_charging_80.qmg
media/battery_charging_85.qmg
media/battery_charging_90.qmg
media/battery_charging_95.qmg
media/battery_charging_100.qmg
media/chargingwarning.qmg
media/Disconnected.qmg
init.rc
"

for FILE in $FILES; do
if [ "$cmd" = "adb" ]
then
adb pull /system/$FILE ../../../vendor/samsung/$DEVICE/proprietary/$FILE
elif [ "$cmd" = "cp" ]
then
cp $2/system/$FILE ../../../vendor/samsung/$DEVICE/proprietary/$FILE
fi
done

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/samsung/$DEVICE/$DEVICE-vendor-blobs.mk
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
PRODUCT_COPY_FILES += \\
vendor/samsung/common/aries/proprietary/libcamera.so:obj/lib/libcamera.so \\
vendor/samsung/common/aries/proprietary/libcamera.so:system/lib/libcamera.so \\
vendor/samsung/common/aries/proprietary/libcamera_client.so:system/lib/libcamera.so \\
vendor/samsung/common/aries/proprietary/libActionShot.so:system/lib/libActionShot.so \\
vendor/samsung/common/aries/proprietary/libCaMotion.so:system/lib/libCaMotion.so \\
vendor/samsung/common/aries/proprietary/libcaps.so:system/lib/libcaps.so \\
vendor/samsung/common/aries/proprietary/libPanoraMax1.so:system/lib/libPanoraMax1.so \\
vendor/samsung/common/aries/proprietary/libPlusMe.so:system/lib/libPlusMe.so \\
vendor/samsung/common/aries/proprietary/libarccamera.so:system/lib/libarccamera.so \\
vendor/samsung/common/aries/proprietary/libcamerafirmwarejni.so:system/lib/libcamerafirmwarejni.so \\
vendor/samsung/common/aries/proprietary/libcameraservice.so:system/lib/libcameraservice.so \\
vendor/samsung/common/aries/proprietary/libseccamera.so:system/lib/libseccamera.so \\
vendor/samsung/common/aries/proprietary/libseccameraadaptor.so:system/lib/libseccameraadaptor.so \\
vendor/samsung/common/aries/proprietary/datapattern_420sp.yuv:system/cameradata/datapattern_420sp.yuv \\
vendor/samsung/common/aries/proprietary/datapattern_front_420sp.yuv:system/cameradata/datapattern_front_420sp.yuv \\

# WiFi & Bluetooth
PRODUCT_COPY_FILES += \\
vendor/samsung/__DEVICE__/proprietary/etc/wifi/nvram_net.txt:system/etc/wifi/nvram_net.txt \\
vendor/samsung/__DEVICE__/proprietary/etc/wifi/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \\
vendor/samsung/__DEVICE__/proprietary/etc/wifi/bcm4329_aps.bin:system/etc/wifi/bcm4329_aps.bin \\
vendor/samsung/__DEVICE__/proprietary/etc/wifi/bcm4329_mfg.bin:system/etc/wifi/bcm4329_mfg.bin \\
vendor/samsung/__DEVICE__/proprietary/etc/wifi/bcm4329_sta.bin:system/etc/wifi/bcm4329_sta.bin \\
vendor/samsung/__DEVICE__/proprietary/bin/BCM4329B1_002.002.023.0417.0430.hcd:system/bin/BCM4329B1_002.002.023.0417.0430.hcd \\

#GPS
PRODUCT_COPY_FILES += \\
vendor/samsung/__DEVICE__/proprietary/lib/libgps.so:system/lib/libgps.so \\
vendor/samsung/__DEVICE__/proprietary/lib/libsecgps.so:system/lib/libsecgps.so \\


# Firmware files
PRODUCT_COPY_FILES += \\
vendor/samsung/__DEVICE__/proprietary/seh/CE147F00.bin:system/firmware/CE147F00.bin \\
vendor/samsung/__DEVICE__/proprietary/seh/CE147F01.bin:system/firmware/CE147F01.bin \\
vendor/samsung/__DEVICE__/proprietary/seh/CE147F02.bin:system/firmware/CE147F02.bin \\
vendor/samsung/__DEVICE__/proprietary/seh/CE147F03.bin:system/firmware/CE147F03.bin

# Display (3D)
PRODUCT_COPY_FILES += \\
vendor/samsung/__DEVICE__/proprietary/lib/egl/libEGL_POWERVR_SGX540_120.so:system/lib/egl/libEGL_POWERVR_SGX540_120.so \\
vendor/samsung/__DEVICE__/proprietary/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \\
vendor/samsung/__DEVICE__/proprietary/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so:system/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \\
vendor/samsung/__DEVICE__/proprietary/lib/egl/libGLESv2_POWERVR_SGX540_120.so:system/lib/egl/libGLESv2_POWERVR_SGX540_120.so \\
vendor/samsung/__DEVICE__/proprietary/lib/libIMGegl.so:system/lib/libIMGegl.so \\
vendor/samsung/__DEVICE__/proprietary/lib/libpvr2d.so:system/lib/libpvr2d.so \\
vendor/samsung/__DEVICE__/proprietary/lib/libsrv_init.so:system/lib/libsrv_init.so \\
vendor/samsung/__DEVICE__/proprietary/lib/libsrv_um.so:system/lib/libsrv_um.so \\
vendor/samsung/__DEVICE__/proprietary/lib/libPVRScopeServices.so:system/lib/libPVRScopeServices.so \\
vendor/samsung/__DEVICE__/proprietary/lib/libglslcompiler.so:system/lib/libglslcompiler.so \\
vendor/samsung/__DEVICE__/proprietary/lib/libpvrANDROID_WSEGL.so:system/lib/libpvrANDROID_WSEGL.so \\
vendor/samsung/__DEVICE__/proprietary/bin/pvrsrvinit:system/bin/pvrsrvinit

# Sensors, Lights etc
PRODUCT_COPY_FILES += \\
vendor/samsung/__DEVICE__/proprietary/lib/hw/gralloc.s5pc110.so:system/lib/hw/gralloc.s5pc110.so \\
vendor/samsung/__DEVICE__/proprietary/lib/hw/sensors.default.so:system/lib/hw/sensors.default.so

# RIL
PRODUCT_COPY_FILES += \\
vendor/samsung/__DEVICE__/proprietary/lib/libril.so:system/lib/libril.so \\
vendor/samsung/__DEVICE__/proprietary/lib/libsec-ril40.so:system/lib/libsec-ril40.so \\
vendor/samsung/__DEVICE__/proprietary/lib/libsecril-client.so:system/lib/libsecril-client.so

# PPP
PRODUCT_COPY_FILES += \\
vendor/samsung/__DEVICE__/proprietary/bin/pppd_runner:system/bin/pppd_runner

#Sensors
PRODUCT_COPY_FILES += \\
vendor/samsung/__DEVICE__/proprietary/lib/libsensor_yamaha.so:system/lib/libsensor_yamaha.so \\
vendor/samsung/__DEVICE__/proprietary/lib/libsensor_yamaha_test.so:system/lib/libsensor_yamaha_test.so \\
vendor/samsung/__DEVICE__/proprietary/lib/libms3c_yamaha.so:system/lib/libms3c_yamaha.so \\
vendor/samsung/__DEVICE__/proprietary/bin/sensorserver_yamaha:system/bin/sensorserver_yamaha \\
vendor/samsung/__DEVICE__/proprietary/bin/sensorcalibutil_yamaha:system/bin/sensorcalibutil_yamaha \\
vendor/samsung/__DEVICE__/proprietary/bin/sensorstatutil_yamaha:system/bin/sensorstatutil_yamaha

#
# WIMAX
#
#PRODUCT_COPY_FILES += \\
# vendor/samsung/__DEVICE__/proprietary/lib/libSECmWiMAXcAPI.so:system/lib/libSECmWiMAXcAPI.so \\
# vendor/samsung/__DEVICE__/proprietary/lib/libWiMAXLineTest.so:system/lib/libWiMAXLineTest.so \\
# vendor/samsung/__DEVICE__/proprietary/lib/libWiMAXNative.so:system/lib/libWiMAXNative.so \\
# vendor/samsung/__DEVICE__/proprietary/lib/libWiMAXNativeODB.so:system/lib/libWiMAXNativeODB.so \\
# vendor/samsung/__DEVICE__/proprietary/lib/libwimaxne.so:system/lib/libwimaxne.so \\
# vendor/samsung/__DEVICE__/proprietary/lib/libwimaxwtm.so:system/lib/libwimaxwtm.so \\
# vendor/samsung/__DEVICE__/proprietary/etc/wimax_boot.bin:system/etc/wimax_boot.bin \\
# vendor/samsung/__DEVICE__/proprietary/etc/wimaxfw.bin:system/etc/wimaxfw.bin \\
# vendor/samsung/__DEVICE__/proprietary/etc/wimaxloader.bin:system/etc/wimaxloader.bin

# Misc
PRODUCT_COPY_FILES += \\
vendor/samsung/__DEVICE__/proprietary/bin/immvibed:system/bin/immvibed \\
vendor/samsung/__DEVICE__/proprietary/bin/logwrapper:system/bin/logwrapper \\
vendor/samsung/__DEVICE__/proprietary/bin/immvibed:system/bin/immvibed \\
vendor/samsung/__DEVICE__/proprietary/bin/killmediaserver:system/bin/killmediaserver \\
vendor/samsung/__DEVICE__/proprietary/bin/notified_event:system/bin/notified_event \\
vendor/samsung/__DEVICE__/proprietary/bin/mfgloader:system/bin/mfgloader \\
vendor/samsung/__DEVICE__/proprietary/bin/netcfg:system/bin/netcfg \\
vendor/samsung/__DEVICE__/proprietary/bin/wlservice:system/bin/wlservice \\
vendor/samsung/__DEVICE__/proprietary/lib/libnetutils.so:system/lib/libnetutils.so

# LPM charging files.
PRODUCT_COPY_FILES += \\
vendor/samsung/__DEVICE__/proprietary/bin/playlpm:system/bin/playlpm \\
vendor/samsung/__DEVICE__/proprietary/bin/charging_mode:system/bin/charging_mode \\
vendor/samsung/__DEVICE__/proprietary/lib/libQmageDecoder.so:system/lib/libQmageDecoder.so \\
vendor/samsung/__DEVICE__/proprietary/media/battery_charging_*.qmg:system/media/battery_charging_*.qmg \\
vendor/samsung/__DEVICE__/proprietary/media/chargingwarning.qmg:system/media/chargingwarning.qmg \\
vendor/samsung/__DEVICE__/proprietary/media/Disconnected.qmg:system/media/Disconnected.qmg

EOF

./setup-makefiles.sh


