<img src="https://github.com/Sanju0910/Sanju0910/blob/main/images/of_logo.png" width=100 height=100 align="left" />  

# Orangefox Recovery for Google Pixel 7a (lynx)

This is still "work in progress" and not a fully working recovery yet.
It does boot up now but has still a lot of things not working. 

- Based on August 2024 Kernel
- Colors (blue/orange etc) are inverted so by default it is "BlueFox" instead of "OrangeFox"
- USB (adb) working
- Encryption is disabled 
- Touch screen and buttons are not working right now!

## Installation methods:

## From recovery:
adb sideload OrangeFox-R11.1-Unofficial-lynx.zip

## From bootloader/fastboot:
fastboot flash vendor_boot OrangeFox-R11.1-Unofficial-lynx.img
