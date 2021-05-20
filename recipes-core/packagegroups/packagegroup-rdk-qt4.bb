SUMMARY = "Custom package group for RDK Qt related bits"

LICENSE = "MIT"

inherit packagegroup

PACKAGES = "\
    packagegroup-rdk-qt-apps \
    packagegroup-rdk-qt4e \
    "

RDEPENDS_packagegroup-rdk-qt-apps = "\
    libqjson-e \
    "

RDEPENDS_packagegroup-rdk-qt4e = "\
    libqt-embedded3support4 \
    libqt-embeddedclucene4 \
    libqt-embeddedcore4 \
    libqt-embeddeddbus4 \
    libqt-embeddedgui4 \
    libqt-embeddedhelp4 \
    libqt-embeddedmultimedia4 \
    libqt-embeddednetwork4 \
    libqt-embeddedscript4 \
    libqt-embeddedscripttools4 \
    libqt-embeddedsql4 \
    libqt-embeddedsvg4 \
    libqt-embeddedtest4 \
    libqt-embeddedwebkit4 \
    libqt-embeddedxml4 \
    qt4-embedded \
    qt4-embedded-fonts-ttf-dejavu \
    qt4-embedded-fonts-ttf-vera \
    qt4-embedded-plugin-iconengine-svgicon \
    qt4-embedded-plugin-imageformat-gif \
    qt4-embedded-plugin-imageformat-ico \
    qt4-embedded-plugin-imageformat-jpeg \
    qt4-embedded-plugin-imageformat-mng \
    qt4-embedded-plugin-imageformat-svg \
    qt4-embedded-plugin-imageformat-tiff \
    qt4-embedded-plugin-mousedriver-tslib \
    qt4-embedded-plugin-phonon-backend-gstreamer \
    qt4-embedded-plugin-script-dbus \
    qt4-embedded-plugin-sqldriver-sqlite \
    "

