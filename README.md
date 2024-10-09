<img src="https://github.com/Sanju0910/Sanju0910/blob/main/images/of_logo.png" width=100 height=100 align="left" />  

# Orangefox Recovery for Google Pixel 7a (lynx)

This is still "work in progress" and not a fully working recovery yet.

# working
 - adb
 - Flashing files and OTA Updates
 - Data Backup/Restore can be used whem the phone is not encrypted
   That can be achieved with DFE-neo but needs a Format Data once after flashing it

# not working 
 - USB OTG
 - Data decryption
 - Slot switching after a OTA file installation
     
## Installation methods:

## From recovery:
adb sideload OrangeFox-R11.1-Unofficial-lynx-v2.zip

## From bootloader/fastboot:
fastboot flash vendor_boot OrangeFox-R11.1-Unofficial-lynx-v2.img

## Changelog

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
