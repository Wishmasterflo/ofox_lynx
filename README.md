<img src="https://github.com/Sanju0910/Sanju0910/blob/main/images/of_logo.png" width=100 height=100 align="left" />  

# Orangefox Recovery for Google Pixel 7a (lynx)

This is still "work in progress" and not a fully working recovery yet.

# working
 - adb / sideload
 - Flashing files and OTA Updates
 - Data Backup/Restore can be used whem the phone is not encrypted
   That can be achieved with DFE-neo but needs a Format Data once after flashing it

# not working 
 - USB OTG
 - Data decryption
     
## Installation methods

## From recovery:
adb sideload OrangeFox-R11.1-Unofficial-lynx-v3.zip

## From bootloader/fastboot:
fastboot flash vendor_boot OrangeFox-R11.1-Unofficial-lynx-v3.img

## Changelog

# 23-Nov-2024 R11.1 V4
  - Synced with latest Orangefox source changes
  - Enabled reflash current Orangefox function after flashing a ROM
  - added adjusted DFE-neo zip file for Google Pixel 7a to download

# 15-Nov-2024 R11.1 V3
  - Synced with latest Orangefox source changes
  - Based on November 2024 Android 15 Kernel
  - Added Pixel Bootctrl HAL (to fix slot switching etc)
  - Added adjusted dfe-neo to Orangefox.zip file
  
# 10-Oct-2024 R11.1 V2
  -  Synced with latest Orangefox source changes
  -  Based on September 2024 Kernel
  -  Fixed inverted colors, so now we have "Orangefox"
  -  USB (adb) working (USB OTG is still not working!)
  -  Automatic slot switching after flashing a OTA File is not working yet
  -  Haptics and Vibration is disabled now (as it conflicts with the Touchscreen)

# 30-Aug-2024 R11.1 V1
  -  Initial Orangefox recovery Version for Google Pixel 7a
  -  Based on August 2024 Kernel
  -  Colors (blue/orange etc) are inverted so by default it is "BlueFox" instead of "OrangeFox"
  -  USB (adb) working (USB OTG is not working yet)
  -  Encryption is disabled for now (as it is not working)
  -  Haptics and Vibration is disabled now (as it conflicts with the Touchscreen)
