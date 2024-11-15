#!/sbin/sh

# echo "empty for C++ code"
FD=$1

ui_print(){

    echo -e "ui_print $1\nui_print" >>"/proc/self/fd/$FD"
}
ui_print "- Starting reflash current recovery"
[ -f /system/bin/magiskboot_28 ] || exit 24
MG="/system/bin/magiskboot_28"
if [ -f "/dev/current_vendor_boot_backup/current_vendor_boot.img" ] ; then
    ui_print "- Detected a backup image of the current recovery; this will be quick!"
    mkdir -pv /dev/repack_vboot/fox
    cd /dev/repack_vboot/fox
    $MG unpack /dev/current_vendor_boot_backup/current_vendor_boot.img
    [ -f /dev/repack_vboot/fox/vendor_ramdisk/ramdisk.cpio ] || {
        ui_print "- Backup of ofox is missing ramdisk.cpio"
        exit 22
    }
    rm -f /dev/repack_vboot/fox/dtb
    cd /dev/repack_vboot/fox/
    $MG repack /dev/current_vendor_boot_backup/current_vendor_boot.img
    for slot in _a _b ; do
        cat /dev/repack_vboot/fox/new-boot.img > /dev/block/by-name/vendor_boot$slot
        ui_print "- Successfully flashed recovery to slot $slot."
    done
else
    exit 25
fi

exit 0
