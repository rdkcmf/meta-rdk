SUMMARY = "Extra utilities for RDK debug images"

LICENSE = "MIT"

inherit packagegroup

PACKAGES = "\
    packagegroup-rdk-debug-extra \
    "

# Packages to be included in 'debug-extra' images
RDEPENDS_packagegroup-rdk-debug-extra = "\
    strace \
    tcf-agent \
    alsa-utils-amixer \
    alsa-utils-aplay \
    ldd \
    gst-meta-audio \
    gst-meta-base \
    gst-meta-video \
    gst-meta-debug \
    gst-ffmpeg \
    gst-plugins-base \
    gst-plugins-good \
    qtbase-examples \
    systemd-analyze \
    "
