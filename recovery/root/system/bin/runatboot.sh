restorecon -v /system/bin/logd
restorecon -v /system/bin/logcat
chmod -R 777 /system/bin        
stop logd
start logd
