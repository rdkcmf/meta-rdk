#!/bin/sh

if [ -f /etc/device.properties ];then
    . /etc/device.properties
fi

DOWNLOAD_APP_MODULE=$1

#Read the RFC value for the app name
if [ "$DEVICE_TYPE" = "broadband" ]; then
    RFC_VALUE=`dmcli eRT getv Device.DeviceInfo.X_RDKCENTRAL-COM_RFC.Feature.$DOWNLOAD_APP_MODULE.Enable | grep bool | awk '{print $5}'`
else
    if [ -f /usr/bin/tr181 ];then
        RFC_VALUE=`/usr/bin/tr181 -g Device.DeviceInfo.X_RDKCENTRAL-COM_RFC.Feature.$DOWNLOAD_APP_MODULE.Enable 2>&1 > /dev/null`
    fi
fi

echo "RFC VALUE:$RFC_VALUE"

if [ "x$RFC_VALUE" != "xtrue" ]; then
    exit 1
else
    exit 0
fi 

