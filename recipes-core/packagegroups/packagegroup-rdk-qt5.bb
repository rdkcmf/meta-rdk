SUMMARY = "Custom package group for RDK Qt5 related bits"

LICENSE = "MIT"

inherit packagegroup populate_sdk_qt5

PACKAGES = "\
    packagegroup-rdk-qt5 \
    "

RDEPENDS_packagegroup-rdk-qt5 = "\
    qtbase \
    ${@bb.utils.contains('DISTRO_FEATURES','build_for_sky', bb.utils.contains('DISTRO_FEATURES', 'comcast_qt5', "qtbase-plugins qtwebsockets", "qtbase-examples qtbase-plugins qtdeclarative qtwayland qtwayland-plugins qtwebsockets qtremoteobjects", d), ' qtbase-fonts qtbase-plugins qtwebsockets', d)} \
    "
