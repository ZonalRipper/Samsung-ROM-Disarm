# SAMSUNG ROM DISARM
 Tool for Samsung ROM builders to Disarm common security features 

---

# SUPPORT DEVICES
`S10` `N10` `S20` `S21`

---

# HOW TO USE
The tool is based off of the assumption that you're using SuperR kitchen for you FW unpacking and ROM modding, this tool will then mod the relevant files within the superR project folder

STEP 1:
Download the FW for the phone
Start a new project in SuperR
Copy the FW to the project folder
Use superR to unpack the FW

STEP 2:
Copy the 'sammy_disarm' script and 'disarm_tools' to the root of your project folder
Ensure your script is set to run as executable

STEP 3:
Open terminal in the root of your project directory
Run the script using super user (I.E sudo ./sammy_disarm_v4.0.sh)
Enter the SU password when prompted
Enter your name of the rom (This will be use as the build name in build.prop)
Enter your device (it must be a supported device, see supported devices above)

---

# DISARM MODS: 
**DEBLOAT SYSTEM:**  
Various App and priv-app debloat  
`system/system/app`


**DEBLOAT PRISM & PRODUCT:**  
Various app and priv-app debloat  
`system/system/priv-app`


**DISABLE SCS SEVRVICE:**  
Disable SCS in  
`prism/etc/init/init.rc`   
`product/etc/init/init.rc`


**MOD SYSTEM BUILD.PROP:**  
Add ROM information and add Build.prop tweaks  
`system/system/build.prop`


**DISABLE FRP:**  
Factory Reset Protection Disable  
`/vendor/build.prop`


**DISABLE ENCRYPTION:**  
Disable fstab encryption of data partition  
S10FSTAB= `/vendor/etc/fstab.exynos9820`  
S20FSTAB= `/vendor/etc/fstab.exynos990`  
S21FSTAB= `/vendor/etc/fstab.exynos2100`


**DISABLE CASS:**  
Disable CASS services  
`/vendor/etc/init/cass.rc`


**PROCA DISABLED:**  
Disable PROCA Services  
`/vendor/etc/init/pa_daemon_teegris.rc`


**DISABLE VAULTKEEPER:**  
Disable VAULTKEEPER  
`/vendor/etc/init/vaultkeeper_common.rc`


**DISABLE WSM:**  
Disable WSM (Galaxy Watch Pairing Fix)  
`/vendor/etc/vintf/manifest.xml`


**SAFETYNET FIX:**  
Patching of keystore file to get safetynet fix working  
`system/bin/keystore`


**BLUETOOTH PATCHING:**  
Patch the libbluetooth.so file to fix lose of BT pariring on reboot  
`system/lib64/libbluetooth.so`
    
