SUMMARY = "Custom package group for RDK bits"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit packagegroup
BLUEZ ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5', 'bluez4', d), '', d)}"

PACKAGES = "\
    packagegroup-rdk-media-common \
    "

CLOSEDCAPTION ?= "closedcaption"

# Generic RDK components
RDEPENDS_packagegroup-rdk-media-common = "\
    ${CLOSEDCAPTION} \
    devicesettings \
    iarmbus \
    iarmmgrs \
    rdk-logger \
    servicemanager \
    gst-plugins-rdk \
    rmfgeneric \
    rmfapp \
    virtual/gst-plugins-playersinkbin \
    virtual/mfrlib \
    rmfstreamer \
    storagemanager \
    iarm-set-powerstate \
    iarm-query-powerstate \
    crashupload \
    crashupload-conf \
    key-simulator \
    tcpdump \
    rdk-diagnostics \
    ipv6calc-main \
    iptables \
    ${@bb.utils.contains("DISTRO_FEATURES", "bluetooth", "${BLUEZ} bluetooth-core bluetooth-mgr virtual/media-utils", "", d)} \
    ${@bb.utils.contains("DISTRO_FEATURES", "bluetooth", \
        bb.utils.contains('DISTRO_FEATURES', 'bluez5', " bluetooth-leappmgr", '', d), "",d)} \
    systemd-usb-support \
    nlmonitor \
    nghttp2-server \
    nghttp2-common \
    stunnel \
    socat \
    rdkmediaplayer \
    ${@bb.utils.contains("DISTRO_FEATURES", "ledmgr", "ledmgr", "" , d)} \
    ${@bb.utils.contains("DISTRO_FEATURES", "safec", "safec", "" , d)} \
    rbus \
    rbus-core \
    telemetry \
    "
RDEPENDS_packagegroup-rdk-media-common_append_qemuall = " sysint "
RDEPENDS_packagegroup-rdk-media-common_append_qemuall = " sysint-conf "
RDEPENDS_packagegroup-rdk-media-common_append_rpi = " rdkmediaplayer "
RDEPENDS_packagegroup-rdk-media-common_append_mipsel = " dca "
RDEPENDS_packagegroup-rdk-media-common_append_arm = " dca "

IMAGE_INSTALL_append_rpi = " e2fsprogs-mke2fs "

#package for firebolt-test-client
RDEPENDS_packagegroup-rdk-media-common += " ${@bb.utils.contains('DISTRO_FEATURES', 'firebolt_test_client', 'firebolt-test-client', '', d)}"
