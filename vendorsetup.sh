
fox_dir=$(pwd)

inject_self_repacker(){
    file="$fox_dir/bootable/recovery/twrpRepacker.cpp"
    # Checking if a file exists
    if [ ! -f "$file" ]; then
        echo "File not found: $file"
        exit 1
    fi
    if grep -q "bool twrpRepacker::Flash_Current_Twrp()" "$file"; then
        echo "Function twrpRepacker::Flash_Current_Twrp() found in file"
        if ! grep -q "if (TWFunc::Path_Exists(\"/system/bin/reflash_recovery.sh\"))" "$file"; then
            echo "Insert the code into the twrpRepacker::Flash_Current_Twrp() function"
            sed -i '/bool twrpRepacker::Flash_Current_Twrp() {/a \
    if (TWFunc::Path_Exists("/system/bin/reflash_recovery.sh")) {\
        gui_print("- Starting custom reflash recovery script\\n");\
        int pipe_fd[2];\
        if (pipe(pipe_fd) == -1) {\
            LOGERR("Failed to create pipe");\
            return false;\
        }\
        if (TWFunc::Path_Exists("/system/bin/reflash_recovery.sh")) {\
            std::string command = "/system/bin/reflash_recovery.sh " + std::to_string(pipe_fd[1]) + " " + std::to_string(pipe_fd[0]);\
            gui_print("- Reflashing recovery\\n");\
            int result = TWFunc::Exec_Cmd(command);\
            if (result != 0) {\
                LOGERR("Script reflash_recovery.sh failed with error code: %d", result);\
                gui_print_color("error", "Script reflash_recovery.sh failed with error code: %d\\n", result);\
                return false;\
            }\
            gui_print_color("green", "- Successfully flashed recovery to both slots\\n");\
            close(pipe_fd[0]);\
            close(pipe_fd[1]);\
            return true;\
        }\
        return false;\
    }' "$file"
            echo "The code has been inserted successfully."
        else
            echo "The code is already present in the twrpRepacker::Flash_Current_Twrp() function."
        fi
    else
        echo "Function twrpRepacker::Flash_Current_Twrp() not found in file."
        exit 1
    fi
}

inject_self_repacker 

export TARGET_ARCH="arm64-v8a"

# Some about us
export OF_MAINTAINER=Wishmasterflo

# Build environment stuffs
export FOX_BUILD_DEVICE="Pixel7a"
export ALLOW_MISSING_DEPENDENCIES=true
export FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER=1
export TARGET_DEVICE_ALT="Pixel7a, GooglePixel7a, lynx, Lynx"
export FOX_TARGET_DEVICES="Pixel7a, GooglePixel7a, lynx, Lynx"
export BUILD_USERNAME="nobody"
export BUILD_HOSTNAME="android-build"

# Use magisk boot for patching
export OF_USE_MAGISKBOOT=1
export OF_USE_MAGISKBOOT_FOR_ALL_PATCHES=1

# We have a/b partitions
export FOX_AB_DEVICE=1
export FOX_VIRTUAL_AB_DEVICE=1

# Vendor Boot recovery
export FOX_VENDOR_BOOT_RECOVERY=1
export FOX_RECOVERY_VENDOR_BOOT_PARTITION="/dev/block/platform/14700000.ufs/by-name/vendor_boot"
export OF_NO_REFLASH_CURRENT_ORANGEFOX=0

# Screen specifications
export OF_STATUS_INDENT_LEFT=48
export OF_STATUS_INDENT_RIGHT=48
export OF_ALLOW_DISABLE_NAVBAR=0
export OF_CLOCK_POS=0
export OF_SCREEN_H=2400
export OF_STATUS_H=120

# Device stuff
export OF_KEEP_FORCED_ENCRYPTION=1
export OF_NO_TREBLE_COMPATIBILITY_CHECK=1
export OF_FBE_METADATA_MOUNT_IGNORE=1
export OF_USE_LEGACY_BATTERY_SERVICES=1

# Use updated binaries
export FOX_REPLACE_TOOLBOX_GETPROP=1
export FOX_BASH_TO_SYSTEM_BIN=1
export FOX_USE_UPDATED_MAGISKBOOT=1
export FOX_BUILD_BASH=1

# Disable decryption
export OF_SKIP_FBE_DECRYPTION=1

# Run a process after formatting data to work-around MTP issues
export OF_RUN_POST_FORMAT_PROCESS=1

# Use /data/recovery/Fox/ for Storage
export FOX_USE_DATA_RECOVERY_FOR_SETTINGS=1

export OF_QUICK_BACKUP_LIST="/boot;/init_boot;/vendor_boot;/vendor_kernel_boot"

# Magisk
export FOX_USE_SPECIFIC_MAGISK_ZIP=~/Magisk/Magisk-v29.0.zip

# Dont install AROMAFM
export FOX_DELETE_AROMAFM=1

# Add some extras
export FOX_USE_SED_BINARY=1
export FOX_USE_ZIP_BINARY=1
export FOX_USE_TAR_BINARY=1
export FOX_USE_BUSYBOX_BINARY=1
export FOX_USE_BASH_SHELL=1
export OF_USE_LZ4_COMPRESSION=1 
export FOX_USE_NANO_EDITOR=1
export OF_DONT_KEEP_LOG_HISTORY=1
export OF_SUPPORT_ALL_BLOCK_OTA_UPDATES=0
export FOX_INSTALLER_DISABLE_AUTOREBOOT=1
