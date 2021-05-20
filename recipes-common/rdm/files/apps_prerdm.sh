#!/bin/sh

. /etc/device.properties

APP_MOUNT_PATH=/media/apps

if [ "x$HDD_ENABLED" == "xtrue" ]; then
    if [ ! -d $HDD_APP_MOUNT_PATH ]; then
       mkdir -p $HDD_APP_MOUNT_PATH
    fi

    # Mount the app download directory of HDD to /media/apps
    checkmount=`mount | grep -i $APP_MOUNT_PATH`
    if [ ! "$checkmount" ]; then
        echo "Mounting $HDD_APP_MOUNT_PATH into $APP_MOUNT_PATH"
        mount --bind $HDD_APP_MOUNT_PATH $APP_MOUNT_PATH
    fi
fi
