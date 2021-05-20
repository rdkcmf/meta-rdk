SUMMARY = "Custom package group for OSS bits used in RDK"

LICENSE = "MIT"

inherit packagegroup

PACKAGES = "\
    packagegroup-rdk-oss \
    "

# Opensource components used in RDK
RDEPENDS_packagegroup-rdk-oss = "\
    curl \
    dropbear \
    e2fsprogs \
    e2fsprogs-e2fsck \
    e2fsprogs-mke2fs \
    e2fsprogs-tune2fs \
    fcgi \
    glib-2.0 \
    gnutls \
    gssdp \
    gst-fluendo-mpegdemux \
    gst-meta-audio \
    gst-meta-base \
    gst-meta-video \
    gupnp \
    iksemel \
    jansson \
    libgcrypt \
    libgpg-error \
    libpcre \
    libsoup-2.4 \
    libxml2 \
    lighttpd \
    log4c \
    logrotate \
    mtd-utils-ubifs \
    mongoose \
    neon \
    popt \
    smartmontools \
    spawn-fcgi \
    yajl \
    libtinyxml \
    gupnp-av \
    gst-ffmpeg \
    gst-plugins-base \
    gst-plugins-good \
    perl \
    "
