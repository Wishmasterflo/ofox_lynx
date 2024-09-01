<img src="https://github.com/Sanju0910/Sanju0910/blob/main/images/of_logo.png" width=100 height=100 align="left" />  

# Orangefox Recovery for Google Pixel 7a (lynx)

This is still "work in progress" and not a fully working recovery yet.
  
## Installation methods:

## From recovery:
adb sideload OrangeFox-R11.1-Unofficial-lynx.zip

## From bootloader/fastboot:
fastboot flash vendor_boot OrangeFox-R11.1-Unofficial-lynx.img

## Changelog

# 30-Aug-2024 R11.1 V1
  -  Initial Orangefox recovery Version for Google Pixel 7a
  -  Based on August 2024 Kernel
  -  Colors (blue/orange etc) are inverted so by default it is "BlueFox" instead of "OrangeFox"
  -  USB (adb) working (USB OTG is not working yet)
  -  Encryption is disabled for now (as it is not working)
  -  Haptics and Vibration is disabled now (as it conflicts with the Touchscreen)
