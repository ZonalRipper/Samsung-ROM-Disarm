#!/bin/sh
#
# A ROM MODDING SCRIPT BY ZONALRIPPER
#
# View README.md for details

###############################################################
# VERSION CONTROL                                             #
# v1.0 - initial version                                      #
# v1.1 - added removal of avb string from fstab file          #
# v1.2 - enabled sparse feat.					              #
# v1.3 - enabled brotli compression				              #
# v1.5 - added more debloat	 				                  #
# v1.6 - added support for S21 fstab                          #
# v1.7 - added omc decryption, fix ussd codes                 #
# v1.8 - changed to use img2sdat in tools folder    		  #
# v2.0 - added more debloat options			                  #
# v3.0 - paramatised the tasks                                #
# v3.1 - added more debloat                                   #
# v3.2 - added BT lib patch + changed tools folder name       #
# v3.3 - added device seperation (S10,S20,S21)                #
# v3.4 - Cleanup for S10 device                               #
# V3.5 - Add keystore patching                                #
# v3.6 - change lib and keystore patching method              #
# v4.0 - Rework to mod system folder  #GitUpload              #
# v4.1 - Add support for N10 device and cleanup of code       #
# v4.2 - comment out knoxcore from debloat                    #
# v4.3 - fixed secure folder for S20						  #
# v4.4 - added more debloat options							  #
# v4.5 - Added FRP and Reactivation Disable for vendor        #
# v4.6 - Added floating features for S10,N10 & S20            #
# v4.7 - FixTypo and Latest Debloat                           #
# v4.8 - disable liboemcrypto.so for netflix fix              #
# v4.9 - AR removal and cleanup                               #
###############################################################

###############################################################
#script function for changing prop values                     #
#usage setProperty "property.name" "newValue" "FileToUpdate"  #
###############################################################
printf -- 'WELCOME TO SAMSUNG ROM DISARM TOOL \n';

setProperty()
{
  awk -v pat="^$1=" -v value="$1=$2" '{ if ($0 ~ pat) print value; else print $0; }' $3 > $3.tmp
  mv $3.tmp $3
}

read -p "Enter ROM version: " romversion

# AMEND S20/S21 SYSTEM DEBLOAT HERE
debloatSystem() {
local md5
local i

rm -R -f $SYSMOUNT/system/app/AutomationTest_FB
rm -R -f $SYSMOUNT/system/app/ESEServiceAgent
rm -R -f $SYSMOUNT/system/app/EasterEgg
rm -R -f $SYSMOUNT/system/app/Facebook_stub
rm -R -f $SYSMOUNT/system/app/FactoryCameraFB
rm -R -f $SYSMOUNT/system/app/FBAppManager_NS
rm -R -f $SYSMOUNT/system/app/KidsHome_Installer
rm -R -f $SYSMOUNT/system/app/LiveDrawing
rm -R -f $SYSMOUNT/system/app/ARDrawing
rm -R -f $SYSMOUNT/system/app/ARZone
rm -R -f $SYSMOUNT/system/priv-app/AREmoji
rm -R -f $SYSMOUNT/system/priv-app/AREmojiEditor
rm -R -f $SYSMOUNT/system/priv-app/AvatarEmojiSticker_Palette
rm -R -f $SYSMOUNT/system/app/LiveTranscribe
rm -R -f $SYSMOUNT/system/app/MDMApp
rm -R -f $SYSMOUNT/system/app/mldapchecker
rm -R -f $SYSMOUNT/system/app/Netflix_activationCommon
rm -R -f $SYSMOUNT/system/app/Netflix_stub
rm -R -f $SYSMOUNT/system/app/Notes40
rm -R -f $SYSMOUNT/system/app/SamsungPassAutofill_v1
rm -R -f $SYSMOUNT/system/app/SamsungTTS
rm -R -f $SYSMOUNT/system/app/SmartReminder
rm -R -f $SYSMOUNT/system/app/UniversalMDMClient
rm -R -f $SYSMOUNT/system/app/HoneyBoard/oat
rm -R -f $SYSMOUNT/system/priv-app/CIDManager
rm -f $SYSMOUNT/system/priv-app/ContainerAgent3/ContainerAgent3.apk
rm -R -f $SYSMOUNT/system/priv-app/FBInstaller_NS
rm -R -f $SYSMOUNT/system/priv-app/FBServices
rm -R -f $SYSMOUNT/system/priv-app/FotaAgent
rm -R -f $SYSMOUNT/system/priv-app/LiveStickers
rm -R -f $SYSMOUNT/system/priv-app/MateAgent
rm -R -f $SYSMOUNT/system/priv-app/OneDrive_Samsung_v3
rm -R -f $SYSMOUNT/system/priv-app/PaymentFramework
rm -R -f $SYSMOUNT/system/priv-app/SamsungBilling
rm -R -f $SYSMOUNT/system/priv-app/SamsungPass
rm -R -f $SYSMOUNT/system/priv-app/SamsungSocial
rm -R -f $SYSMOUNT/system/priv-app/SOAgent
rm -R -f $SYSMOUNT/system/priv-app/Tips
rm -R -f $SYSMOUNT/system/priv-app/Upday
rm -R -f $SYSMOUNT/system/priv-app/Fast/oat
rm -R -f $SYSMOUNT/system/priv-app/NSDSWebApp/oat
rm -R -f $SYSMOUNT/system/priv-app/SamsungInCallUI/oat
rm -R -f $SYSMOUNT/system/priv-app/SecSettings/oat
rm -R -f $SYSMOUNT/system/priv-app/SecureFolder/oat
rm -R -f $SYSMOUNT/system/priv-app/Telecom/oat
rm -R -f $SYSMOUNT/system/priv-app/TeleService/oat
rm -R -f $SYSMOUNT/system/preload/AirCommand
rm -R -f $SYSMOUNT/system/preload/Facebook_stub_preload
rm -R -f $SYSMOUNT/system/preload/SmartSwitch
rm -R -f $SYSMOUNT/system/hidden/SmartTutor
rm -f $SYSMOUNT/system/etc/sysconfig/samsungpassapp.xml
rm -f $SYSMOUNT/system/recovery-from-boot.p
rm -f $SYSMOUNT/system/tts/lang_SMT/smt_es_MX*.*
rm -f $SYSMOUNT/system/tts/lang_SMT/smt_en_GB*.*
rm -f $SYSMOUNT/system/tts/lang_SMT/smt_pt_BR*.*
rm -f $SYSMOUNT/system/tts/lang_SMT/smt_ru_RU*.*
rm -f $SYSMOUNT/system/framework/oat/arm64/services.art
rm -f $SYSMOUNT/system/framework/oat/arm64/services.odex
rm -f $SYSMOUNT/system/framework/oat/arm64/services.vdex
# DISABLED
# rm -R -f $SYSMOUNT/system/app/AirReadingGlass
# rm -R -f $SYSMOUNT/system/app/BBCAgent
# rm -R -f $SYSMOUNT/system/app/KnoxAttestationAgent
# rm -R -f $SYSMOUNT/system/app/LinkSharing_v11
# rm -R -f $SYSMOUNT/system/app/SecurityLogAgent
# rm -R -f $SYSMOUNT/system/priv-app/AirCommand
# rm -R -f $SYSMOUNT/system/priv-app/AuthFramework
# rm -R -f $SYSMOUNT/system/priv-app/EnhancedAttestationAgent
# rm -R -f $SYSMOUNT/system/priv-app/KLMSAgent
# rm -R -f $SYSMOUNT/system/priv-app/knoxanalyticsagent
# rm -R -f $SYSMOUNT/system/priv-app/KnoxCore
# rm -R -f $SYSMOUNT/system/priv-app/knoxvpnproxyhandler
# rm -R -f $SYSMOUNT/system/priv-app/Quickboard ## media and devices buttons
# rm -R -f $SYSMOUNT/system/priv-app/StickerFaceARAvatar
# rm -R -f $SYSMOUNT/system/priv-app/YourPhone_P1_5 ## Link to Windows
# rm -R -f $SYSMOUNT/system/container/SharedDeviceKeyguard
# rm -f $SYSMOUNT/system/etc/sysconfig/samsungauthframework.xml
}

# AMEND S10/N10 SYSTEM DEBLOAT HERE
s10debloatSystem() {
local md5
local i

rm -R -f $SYSMOUNT/system/app/AutomationTest_FB
rm -R -f $SYSMOUNT/system/app/EasterEgg
rm -R -f $SYSMOUNT/system/app/ESEServiceAgent
rm -R -f $SYSMOUNT/system/app/Facebook_stub
rm -R -f $SYSMOUNT/system/app/FactoryCameraFB
rm -R -f $SYSMOUNT/system/app/FBAppManager_NS
rm -R -f $SYSMOUNT/system/app/KidsHome_Installer
rm -R -f $SYSMOUNT/system/app/LiveDrawing
rm -R -f $SYSMOUNT/system/app/ARDrawing
rm -R -f $SYSMOUNT/system/app/ARZone
rm -R -f $SYSMOUNT/system/priv-app/AREmoji
rm -R -f $SYSMOUNT/system/priv-app/AREmojiEditor
rm -R -f $SYSMOUNT/system/priv-app/AvatarEmojiSticker_Palette
rm -R -f $SYSMOUNT/system/app/LiveTranscribe
rm -R -f $SYSMOUNT/system/app/Maps
rm -R -f $SYSMOUNT/system/app/MDMApp
rm -R -f $SYSMOUNT/system/app/mldapchecker
rm -R -f $SYSMOUNT/system/app/SamsungPassAutofill_v1
rm -R -f $SYSMOUNT/system/app/SamsungTTS
rm -R -f $SYSMOUNT/system/app/UniversalMDMClient
rm -R -f $SYSMOUNT/system/app/HoneyBoard/oat
rm -R -f $SYSMOUNT/system/priv-app/CIDManager
rm -R -f $SYSMOUNT/system/priv-app/EnhancedAttestationAgent
rm -R -f $SYSMOUNT/system/priv-app/FBInstaller_NS
rm -R -f $SYSMOUNT/system/priv-app/FBServices
rm -R -f $SYSMOUNT/system/priv-app/FotaAgent
rm -R -f $SYSMOUNT/system/priv-app/KLMSAgent
rm -R -f $SYSMOUNT/system/priv-app/MateAgent
rm -R -f $SYSMOUNT/system/priv-app/OneDrive_Samsung_v3
rm -R -f $SYSMOUNT/system/priv-app/PaymentFramework
rm -R -f $SYSMOUNT/system/priv-app/SamsungBilling
rm -R -f $SYSMOUNT/system/priv-app/SamsungPass
rm -R -f $SYSMOUNT/system/priv-app/SamsungSocial
rm -R -f $SYSMOUNT/system/priv-app/SOAgent
rm -R -f $SYSMOUNT/system/priv-app/Upday
rm -R -f $SYSMOUNT/system/priv-app/Fast/oat
rm -R -f $SYSMOUNT/system/priv-app/NSDSWebApp/oat
rm -R -f $SYSMOUNT/system/priv-app/SamsungInCallUI/oat
rm -R -f $SYSMOUNT/system/priv-app/SecSettings/oat
rm -R -f $SYSMOUNT/system/priv-app/SecureFolder/oat
rm -R -f $SYSMOUNT/system/priv-app/Telecom/oat
rm -R -f $SYSMOUNT/system/priv-app/TeleService/oat
rm -f $SYSMOUNT/system/etc/sysconfig/samsungpassapp.xml
rm -f $SYSMOUNT/system/recovery-from-boot.p
rm -f $SYSMOUNT/system/tts/lang_SMT/smt_es_MX*.*
rm -f $SYSMOUNT/system/tts/lang_SMT/smt_en_GB*.*
rm -f $SYSMOUNT/system/tts/lang_SMT/smt_pt_BR*.*
rm -f $SYSMOUNT/system/tts/lang_SMT/smt_ru_RU*.*
rm -f $SYSMOUNT/system/framework/oat/arm64/services.art
rm -f $SYSMOUNT/system/framework/oat/arm64/services.odex
rm -f $SYSMOUNT/system/framework/oat/arm64/services.vdex
#DISABLED
# rm -R -f $SYSMOUNT/system/app/BBCAgent
# rm -R -f $SYSMOUNT/system/app/KnoxAttestationAgent
# rm -R -f $SYSMOUNT/system/app/LinkSharing_v11
# rm -R -f $SYSMOUNT/system/app/SecurityLogAgent
# rm -R -f $SYSMOUNT/system/priv-app/AuthFramework
# rm -f $SYSMOUNT/system/priv-app/ContainerAgent3/ContainerAgent3.apk
# rm -R -f $SYSMOUNT/system/priv-app/knoxanalyticsagent
# rm -R -f $SYSMOUNT/system/priv-app/KnoxCore
# rm -R -f $SYSMOUNT/system/priv-app/knoxvpnproxyhandler
# rm -R -f $SYSMOUNT/system/priv-app/Quickboard
# rm -R -f $SYSMOUNT/system/container/SharedDeviceKeyguard
# rm -f $SYSMOUNT/system/etc/sysconfig/samsungauthframework.xml
}

# AMEND S20/S21 PRODUCT/PRISM DEBLOAT HERE
debloatPPV() {
local md5
local i

rm -R -f product/app/Maps
rm -R -f product/app/Messages
rm -R -f product/app/YouTube
#rm -R -f product/priv-app/Velvet
rm -R -f prism/app/*
rm -R -f prism/media/carriers/single/PRT/media/bootsamsung.qmg
rm -R -f prism/media/carriers/single/PRT/media/video/shutdown/shutdown.qmg
rm -R -f prism/preload/SER/hidden_app/yandex.search.apk
rm -R -f prism/media/carriers/single/PRT/wallpaper/drawable/3D*
rm -R -f prism/media/carriers/single/PRT/wallpaper/drawable/bable*
rm -R -f prism/media/carriers/single/PRT/wallpaper/drawable/brokat*
rm -R -f prism/media/carriers/single/PRT/wallpaper/drawable/geometria*
find $PWD/prism/HWRDB/data -mindepth 1 -maxdepth 1 -type f -not -name "hwr_ar.dat" -not -name "hwr_de_DE.dat" -not -name "hwr_en_US.dat" -not -name "hwr_en_GB.dat" -not -name "hwr_es_ES.dat" -not -name "hwr_fr_FR.dat" -not -name "hwr_ro_RO.dat" -not -name "hwr_ru_RU.dat" -exec rm -rf '{}' \;
rm -R -f prism/priv-app/*
rm -R -f prism/sipdb/Xt9/*
find $PWD/prism/sipdb/SwiftKey -mindepth 1 -maxdepth 1 -type d -not -name "ar" -not -name "de" -not -name "en_us" -not -name "en_gb" -not -name "es_es" -not -name "fr_fr" -not -name "ro" -not -name "ru" -exec rm -rf '{}' \;
}

# AMEND S10/N10 PRODUCT DEBLOAT HERE
s10debloatPPV() {
local md5
local i

rm -R -f product/app/Multi_SKU*
rm -R -f product/app/MySingtel*
rm -R -f product/app/yandex*
rm -R -f product/preload/INS/hidden_app/app/*
rm -R -f product/HWRDB/data/hwr_zh*
rm -R -f product/priv-app/*
rm -R -f product/sipdb/Xt9/*
find $PWD/product/sipdb/SwiftKey -mindepth 1 -maxdepth 1 -type d -not -name "ar" -not -name "de" -not -name "en_us" -not -name "en_gb" -not -name "es_es" -not -name "fr_fr" -not -name "ro" -not -name "ru" -exec rm -rf '{}' \;
}

# AMEND SYSTEM BUILD PROP TWEAKS HERE FOR ALL VERSIONS
BUILDPROP="
##CUSTOM TWEAKS##
fw.max_users=3
fw.power_user_switcher=1
fw.show_hidden_users=1
fw.show_multiuserui=1
ring.delay=0
ro.kernel.android.checkjni=0
ro.kernel.checkjni=0
ro.media.enc.jpeg.quality=100
ro.securestorage.support=false
ro.telephony.call_ring.delay=0
wlan.wfd.hdcp=disable
ro.security.vaultkeeper.native=0
ro.config.hw_quickpoweron=true
profiler.force_disable_err_rpt=1
profiler.force_disable_ulog=1
wifi.supplicant_scan_interval=120
debug.performance.tuning=1
ro.HOME_APP_ADJ=1
ro.lge.proximity.delay=25
mot.proximity.delay=25
ro.ril.power_collapse=1
pm.sleep_mode=1
persist.cust.tel.eons=1
persist.adb.notify=0
persist.service.adb.enable=1"
#
#
# SYSTEM MODS
modsystem()
{
##SYSTEM DEBLOAT##
SYSMOUNT="$PWD/system"
printf -- 'debloating system \n';
if [ $device = "S21" ] || [ $device = "S20" ]; then
    debloatSystem
    printf -- '\033[32m     ..'$device' System debloated \033[0m\n';
elif [ $device = "S10" ] || [ $device = "N10" ]; then
    s10debloatSystem
    printf -- '\033[32m     ..'$device' System debloated \033[0m\n';
else
    printf -- '\033[31m     ..No system folder found \033[0m\n';
fi

##PATCH BLUETOOTH##
LIBFILE="system/lib64/libbluetooth.so"
printf -- 'Patching '$LIBFILE' \n';
if [ -f "$SYSMOUNT/$LIBFILE" ]; then
    printf -- '\033[32m     ..patching libbluetooth file \033[0m\n';
    perl -0777 -i -pe 's/\x88\x00\x00\x34\xf3\x03\x1f\x2a\xf4\x03\x1f\x2a\x3e\x00\x00\x14/\x1f\x20\x03\xd5\xf3\x03\x1f\x2a\xf4\x03\x1f\x2a\x3e\x00\x00\x14/' $SYSMOUNT/$LIBFILE
    printf -- '\033[32m     ..file succesfully patched \033[0m\n';
else
    printf -- '\033[31m     ..'$LIBFILE' not found \033[0m[0m\n';
fi

##PATCH KEYSTORE##
KEYSTORE="system/bin/keystore"
printf -- 'Patching '$KEYSTORE' \n';
if [ -f "$SYSMOUNT/$KEYSTORE" ]; then
    printf -- '\033[32m     ..patching keystore file \033[0m\n';
    perl -0777 -i -pe 's/\x4e\x00\x74\x69\x6d\x65\x73\x74\x61\x6d\x70\x00\x61\x6e\x64\x72/\x4e\x00\x00\x69\x6d\x65\x73\x74\x61\x6d\x70\x00\x61\x6e\x64\x72/' $SYSMOUNT/$KEYSTORE
    printf -- '\033[32m     ..file succesfully patched \033[0m\n';
else
    printf -- '\033[31m     ..'$KEYSTORE' not found \033[0m[0m\n';
fi

##MOD BUILD.PROP##
SYSBUILDPROP="system/build.prop"
printf -- 'modding '$SYSBUILDPROP' \n';
if [ -f "$SYSMOUNT/$SYSBUILDPROP" ]; then
    setProperty "ro.build.display.id" "$romversion" "$SYSMOUNT/$SYSBUILDPROP" $SYSMOUNT/$SYSBUILDPROP
    printf -- '\033[32m     ..ROM version set \033[0m\n';
    setProperty "ro.config.tima" "0" "$SYSMOUNT/$SYSBUILDPROP"
    printf -- '\033[32m     ..tima disabled \033[0m\n';
    setProperty "ro.config.iccc_version" "iccc_disabled" "$SYSMOUNT/$SYSBUILDPROP"
    printf -- '\033[32m     ..iccc disabled \033[0m\n';
    setProperty "ro.config.dmverity" "false" "$SYSMOUNT/$SYSBUILDPROP"
    printf -- '\033[32m     ..dmverity disabled \033[0m\n';
    echo "$BUILDPROP" >> $SYSMOUNT/$SYSBUILDPROP
    printf -- '\033[32m     ..tweaks added \033[0m\n';
else
    printf -- '\033[31m     ..'$SYSBUILDPROP' not found \033[0m\n';
fi
}

####################
#PRISM/PRODUCT MODS#
####################
modprismproduct()
{
#DEBLOAT PRISM
printf -- 'debloating prism & product \n';
if [ $device = "S20" ] || [ $device = "S21" ]; then
    debloatPPV
    printf -- '\033[32m     ..'$device' Prism/Product debloated \033[0m\n';
elif [ $device = "S10" ] || [ $device = "N10" ]; then
    s10debloatPPV
    printf -- '\033[32m     ..'$device' Prism/Product debloated \033[0m\n';
else
    printf -- '\033[31m     ..No Prism/Product found for '$device' \033[0m\n';
fi

#DISABLE SCS SERVICE
printf -- 'disable SCS service \n';
PRISMINIT=prism/etc/init/init.rc
PRODUCTINIT=product/etc/init/init.rc
if [ $device = "S20" ] || [ $device = "S21" ]; then
    sed -i 's/start\sscs/stop\ scs/g' $PWD/$PRISMINIT
    printf -- '\033[32m     ..SCS stopped \033[0m\n';
elif [ $device = "S10" ] || [ $device = "N10" ]; then
    sed -i 's/start\sscs/stop\ scs/g' $PWD/$PRODUCTINIT
    printf -- '\033[32m     ..SCS stopped \033[0m\n';
else
    printf -- '\033[31m     ..Failed to disable SCS service \033[0m\n';
fi

#DECODE CSC FILES S10 N10
OMC="/product/omc"
DECODE="/disarm_tools/omc-decoder.jar"
printf -- 'decoding CSC files in product \n'
if [ $device = "S10" ] || [ $device = "N10" ] ; then
    if [ -d "$PWD/product/omc" ] && [ -f "$PWD/$DECODE" ]; then
        java -jar $PWD/$DECODE -i $PWD/$OMC -o $PWD/$OMC
        printf -- '\033[32m     ..CSC files decoded \033[0m\n';
    else
        printf -- '\033[31m     ..No decode tool or omc folder found \033[0m\n';
    fi
else
    printf -- '\033[31m     ..Skipped as only on S10 & N10 devices \033[0m\n';
fi
}

#VENDOR MODS
modvendor()
{
#DISABLE FRP & INCREASE FRAME BUFFER
VENDORBUILDPROP=/vendor/build.prop
printf -- 'modding '$VENDORBUILDPROP' \n';
if [ -f "$PWD/$VENDORBUILDPROP" ]; then
    setProperty "ro.frp.pst" "" "$PWD/$VENDORBUILDPROP"
    printf -- '\033[32m     ..frp disabled \033[0m\n';
    setProperty "ro.surface_flinger.max_frame_buffer_acquired_buffers" "4" "$PWD/$VENDORBUILDPROP"
    printf -- '\033[32m     ..frame buffer increased \033[0m\n';
else
    printf -- '\033[31m     ..'$VENDORBUILDPROP' not found \033[0m\n';
fi

#DISABLE FRP AND GOOGLE REACTIVATION
UEVENTD=/vendor/ueventd.rc
printf -- 'modding '$UEVENTD' \n';
if [ $device = "S20" ] || [ $device = "S21" ]; then
    sed -i -e 's/\/dev\/block\/by-name\/persist/#\/dev\/block\/by-name\/persist/g' $PWD/$UEVENTD
    sed -i -e 's/\/dev\/block\/platform\/13100000.ufs\/by-name\/persistent/#\/dev\/block\/platform\/13100000.ufs\/by-name\/persistent/g' $PWD/$UEVENTD
    sed -i -e 's/\/dev\/block\/platform\/13100000.ufs\/by-name\/steady/#\/dev\/block\/platform\/13100000.ufs\/by-name\/steady/g' $PWD/$UEVENTD
    sed -i -e 's/\/dev\/block\/platform\/13100000.ufs\/by-name\/param/#\/dev\/block\/platform\/13100000.ufs\/by-name\/param/g' $PWD/$UEVENTD
    printf -- '\033[32m     ..FRP and Reactivation disabled for '$device' \033[0m\n';
elif [ $device = "S10" ] || [ $device = "N10" ]; then
    sed -i -e 's/\/dev\/block\/by-name\/persist/#\/dev\/block\/by-name\/persist/g' $PWD/$UEVENTD
    sed -i -e 's/\/dev\/block\/platform\/13d60000.ufs\/by-name\/persistent/#\/dev\/block\/platform\/13d60000.ufs\/by-name\/persistent/g' $PWD/$UEVENTD
    sed -i -e 's/\/dev\/block\/platform\/13d60000.ufs\/by-name\/steady/#\/dev\/block\/platform\/13d60000.ufs\/by-name\/steady/g' $PWD/$UEVENTD
    printf -- '\033[32m     ..FRP and Reactivation disabled for '$device' \033[0m\n';
else
    printf -- '\033[31m     ..'$UEVENTD' not found \033[0m\n';
fi

#MOD FSTAB ENCRYPTION OPTIONS
FSTAB="$(find $PWD/vendor/etc/ -maxdepth 1 -name "fstab.exynos*" -exec basename {} \;)"
FSTABDIR="$PWD/vendor/etc/"
printf -- 'modding '$FSTAB' \n'
if [ $FSTAB = "fstab.exynos9820" ] || [ $FSTAB = "fstab.exynos9825" ] || [ $FSTAB = "fstab.exynos990" ]; then
    sed -i -e 's/fileencryption=ice/encryptable=ice/g' $FSTABDIR/$FSTAB
    sed -i -e 's/avb,//g' $FSTABDIR/$FSTAB
    sed -i -e 's/avb=vbmeta,//g' $FSTABDIR/$FSTAB
    sed -i -e 's/,avb_keys=\/avb\/q-gsi.avbpubkey:\/avb\/r-gsi\.avbpubkey:\/avb\/s-gsi.avbpubkey//g' $FSTABDIR/$FSTAB
    printf -- '\033[32m     ..'$device' encryption disabled \033[0m\n';
elif [ $FSTAB = "fstab.exynos2100" ]; then
    sed -i -e 's/fileencryption=aes-256-xts:aes-256-cts:v2/encryptable=ice/g'  $FSTABDIR/$FSTAB
    sed -i -e 's/avb,//g' $FSTABDIR/$FSTAB
    sed -i -e 's/avb=vbmeta,//g' $FSTABDIR/$FSTAB
    sed -i -e 's/,avb_keys=\/avb\/q-gsi.avbpubkey:\/avb\/r-gsi\.avbpubkey:\/avb\/s-gsi.avbpubkey//g' $FSTABDIR/$FSTAB
    printf -- '\033[32m     ..'$device' encryption disabled \033[0m\n';
else
    printf -- '\033[31m     ..No '$device' FSTAB found \033[0m\n';
fi

#DISABLE CASS
CASS=/vendor/etc/init/cass.rc
printf -- 'modding '$CASS' \n'
if [ -f "$PWD/$CASS" ]; then
    sed -i 's/start\scass/stop\ cass/g' $PWD/$CASS
    printf -- '\033[32m     ..CASS disabled \033[0m\n';
else
    printf -- '\033[31m     ..'$CASS' not found \033[0m\n';
fi

#DISABLE PROCA
PROCA=/vendor/etc/init/pa_daemon_teegris.rc
printf -- 'modding '$PROCA' \n'
if [ -f "$PWD/$PROCA" ]; then
    sed -i 's/start\sproca/stop\ proca/g' $PWD/$PROCA
    printf -- '\033[32m     ..proca disabled \033[0m\n';
else
    printf -- '\033[31m     ..'$PROCA' not found \033[0m\n';
fi

#DISABLE VAULTKEEPER
VAULT=/vendor/etc/init/vaultkeeper_common.rc
printf -- 'modding '$VAULT' \n'
if [ -f "$PWD/$VAULT" ]; then
    sed -i 's/start\svaultkeeper/stop\ vaultkeeper/g' $PWD/$VAULT
    rm -f vendor/etc/vintf/manifest/vaultkeeper_manifest.xml
    rm -f vendor/bin/vaultkeeperd
    printf -- '\033[32m     ..vaultkeeper disabled \033[0m\n';
else
    printf -- '\033[31m     ..'$VAULT' not found \033[0m\n';
fi

#DISABLE WSM, SECURESTORAGE & PROCA
MANIFEST=/vendor/etc/vintf/manifest.xml
printf -- 'modding '$MANIFEST' \n'
if [ $device = "S21" ] || [ $device = "S20" ]; then
    sed -i -e '/<hal format="hidl">/{N;/<name>vendor\.samsung\.hardware\.security\.proca<\/name>/{:loop;N;/<\/hal>/!bloop;d}}' $PWD/$MANIFEST
    sed -i -e '/<hal format="hidl">/{N;/<name>vendor\.samsung\.hardware\.security\.wsm<\/name>/{:loop;N;/<\/hal>/!bloop;d}}' $PWD/$MANIFEST
    printf -- '\033[32m     ..proca & wsm disabled \033[0m\n';
elif [ $device = "S10" ] || [ $device = "N10" ]; then
    sed -i -e '/<hal format="hidl">/{N;/<name>vendor\.samsung\.hardware\.security\.proca<\/name>/{:loop;N;/<\/hal>/!bloop;d}}' $PWD/$MANIFEST
    sed -i -e '/<hal format="hidl">/{N;/<name>vendor\.samsung\.hardware\.security\.wsm<\/name>/{:loop;N;/<\/hal>/!bloop;d}}' $PWD/$MANIFEST
    sed -i -e '/<hal format="hidl">/{N;/<name>vendor\.samsung\.hardware\.security\.securestorage<\/name>/{:loop;N;/<\/hal>/!bloop;d}}' $PWD/$MANIFEST
    printf -- '\033[32m     ..proca, securestorage & wsm disabled \033[0m\n';
else    
    printf -- '\033[31m     ..'$MANIFEST' not found \033[0m\n';
fi

#ADD FLOATING FEATURE
FLOAT=/vendor/etc/floating_feature.xml
printf -- 'modding '$FLOAT' \n'
if [ $device = "S10" ] || [ $device = "N10" ] || [ $device = "S20" ]; then
    sed -i -e '/<\/SecFloatingFeatureSet>/i    <SEC_FLOATING_FEATURE_LAUNCHER_CONFIG_ZERO_PAGE_PACKAGE_NAMES>com.google.android.googlequicksearchbox,com.samsung.android.app.spage<\/SEC_FLOATING_FEATURE_LAUNCHER_CONFIG_ZERO_PAGE_PACKAGE_NAMES>' $PWD/$FLOAT
    printf -- '\033[32m     ..floating features added \033[0m\n';
elif [ $device = "S21" ]; then
    printf -- '\033[31m     ..Mod not needed on S21 \033[0m\n';
else    
    printf -- '\033[31m     ..floating features not added \033[0m\n';
fi

#DISABLE LIBOEMCRYPTO.SO
LIBOEM=/vendor/lib/liboemcrypto.so
printf -- 'modding '$LIBOEM' \n'
if [ -f "$PWD/$LIBOEM" ]; then
    mv $PWD/$LIBOEM $PWD/$LIBOEM.bak
    printf -- '\033[32m     ..liboemcrypto modded \033[0m\n';
else
    printf -- '\033[31m     ..'$LIBOEM' not found \033[0m\n';
fi
}

modoptics()
{
#DECODE CSC S20 S21
OMC="/optics/configs/carriers/"
DECODE="/disarm_tools/omc-decoder.jar"
printf -- 'decoding CSC files in Optics \n'
if [ -d "$PWD/optics" ]; then
    if [ -f "$PWD/$DECODE" ]; then
        java -jar $PWD/$DECODE -i $PWD/$OMC -o $PWD/$OMC
        printf -- '\033[32m     ..CSC files decoded \033[0m\n';
    else
        printf -- '\033[31m     ..decode tool not found in '$DECODE' \033[0m\n';
    fi
else
    printf -- '\033[31m     ..no optics folder found \033[0m\n';
fi
}

S20() {
modsystem
modprismproduct
modvendor
modoptics
}

S21() {
modsystem
modprismproduct
modvendor
modoptics
}

S10() {
modsystem
modprismproduct
modvendor
}

N10() {
modsystem
modprismproduct
modvendor
}

read -p ": Which device are you building for [N10,S10,S20,S21] " device
case "$device" in
    S20) 
        printf -- 'Modding for '$device' device \n'
        S20 ;;
    S21)
        printf -- 'Modding for '$device' device \n'
        S21 ;;
    S10)
        printf -- 'Modding for '$device' device \n'
        S10 ;;
    N10)
        printf -- 'Modding for '$device' device \n'
        N10 ;;
    *) echo "The device $device is not currently supported" ;;
esac

printf -- '\e[5mModding Complete! \e[0m\n'
printf -- 'Script will close in 20seconds \n'
sleep 20