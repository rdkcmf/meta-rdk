SUMMARY = "bluetooth-core"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"

BLUEZ ?= "${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', bb.utils.contains('DISTRO_FEATURES', 'bluez5', 'bluez5', 'bluez4', d), '', d)}"

DEPENDS = "dbus ${BLUEZ} rdk-logger"
RDEPENDS_${PN} = "dbus ${BLUEZ} rdk-logger"
PV = "${RDK_RELEASE}+git${SRCPV}"
SRC_URI = "${CMF_GIT_ROOT}/rdk/components/generic/bluetooth;protocol=${CMF_GIT_PROTOCOL};branch=${CMF_GIT_BRANCH}"
SRCREV = "${AUTOREV}"
S = "${WORKDIR}/git"

CFLAGS_append_morty = " -DMORTY_BUILD"
CFLAGS_append_daisy = " -DMORTY_BUILD"

ENABLE_BTR_IFCE = "--enable-btr-ifce=${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', 'none', d)}"
EXTRA_OECONF += "${ENABLE_BTR_IFCE}"

ENABLE_RDK_LOGGER = "--enable-rdk-logger=${@bb.utils.contains('RDEPENDS_${PN}', 'rdk-logger', 'yes', 'no', d)}"
EXTRA_OECONF += " ${ENABLE_RDK_LOGGER}"

inherit autotools pkgconfig coverity
