SUMMARY = "Image with open source components used in RDK stack"

IMAGE_FEATURES += "package-management"

LICENSE = "MIT"

inherit core-image populate_sdk

IMAGE_ROOTFS_SIZE = "8192"

# QT4e (wrongly?) pulls in these packages which we don't want for now.
BAD_RECOMMENDATIONS = " \
    qt4-embedded-demos \
    qt4-embedded-examples \
    qt4-embedded-demos-doc \
    qt4-embedded-tools \
    qt4-embedded-assistant \
    "

IMAGE_INSTALL += "packagegroup-rdk-oss"

# you can pick Qt4e or Qt5 by (un)commenting the proper line below
# they can't be both installed simulatenously
# it's generally a good idea to remove <build>/tmp when switching back 
# and forth.
# IMAGE_INSTALL += "packagegroup-rdk-qt4e"
IMAGE_INSTALL += "packagegroup-qt5-toolchain-target"
IMAGE_INSTALL += "packagegroup-rdk-qt5"

# for now, let's add 'debug stuff' in our images, we can revisit that later
# and create release vs debug builds.
IMAGE_INSTALL += "packagegroup-rdk-debug"
IMAGE_INSTALL += "packagegroup-rdk-debug-extra"
