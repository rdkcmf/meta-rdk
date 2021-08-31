SUMMARY = "rbus library component"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=ed63516ecab9f06e324238dd2b259549"

SRC_URI = "${CMF_GIT_ROOT}/components/opensource/rbus;protocol=${CMF_GIT_PROTOCOL};branch=${CMF_GIT_BRANCH}"

SRCREV = "${AUTOREV}"
SRCREV_FORMAT = "base"

S = "${WORKDIR}/git"

EXTRA_OECMAKE += " ${@bb.utils.contains('DISTRO_FEATURES', 'gtestapp', '-DENABLE_UNIT_TESTING=ON', '', d)}"

inherit cmake systemd pkgconfig coverity

DEPENDS = "rbus-core rtmessage linenoise"

CFLAGS_append_dunfell = " -Wno-format-truncation "

export RDK_FSROOT_PATH = '${STAGING_DIR_TARGET}'

FILES_${PN}-dev += "${libdir}/cmake"

PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES', 'gtestapp', '${PN}-gtest', '', d)}"

FILES_${PN}-gtest = "\
    ${@bb.utils.contains('DISTRO_FEATURES', 'gtestapp', '${bindir}/rbus_gtest.bin', '', d)} \
"

FILES_${PN}  = " \
    ${libdir}/librbus.so* \
    ${bindir}/rbusTestMultiConsumer \
    ${bindir}/rbusTestConsumer \
    ${bindir}/rbusEventProvider \
    ${bindir}/rbusValueChangeConsumer \
    ${bindir}/rbusValueChangeProvider \
    ${bindir}/rbusGeneralEventProvider \
    ${bindir}/rbusMethodConsumer \
    ${bindir}/rbusSampleProvider \
    ${bindir}/rbusMethodProvider \
    ${bindir}/rbuscli \
    ${bindir}/rbusTableConsumer \
    ${bindir}/rbusGeneralEventConsumer \
    ${bindir}/rbusSampleConsumer \
    ${bindir}/rbusRecoveryConsumer \
    ${bindir}/rbusTestProvider \
    ${bindir}/rbusTableProvider \
    ${bindir}/rbusTestValue \
    ${bindir}/rbusTestMultiProvider \
    ${bindir}/rbus_test.sh \
    ${bindir}/rbusEventConsumer \
    ${bindir}/rbusSampleTableProvider \
    ${bindir}/rbusTestElementTree \
"
FILES_${PN} += "${@bb.utils.contains('DISTRO_FEATURES', 'gtestapp', '${bindir}/rbus_src_gcno.tar', '', d)}"

DOWNLOAD_APPS="${@bb.utils.contains('DISTRO_FEATURES', 'gtestapp', 'gtestapp-rbus', '', d)}"
inherit comcast-package-deploy
CUSTOM_PKG_EXTNS="gtest"
SKIP_MAIN_PKG="yes"
DOWNLOAD_ON_DEMAND="yes"
