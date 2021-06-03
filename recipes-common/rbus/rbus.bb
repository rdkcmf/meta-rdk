SUMMARY = "rbus library component"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=ed63516ecab9f06e324238dd2b259549"

SRC_URI = "${CMF_GIT_ROOT}/components/opensource/rbus;protocol=${CMF_GIT_PROTOCOL};branch=${CMF_GIT_BRANCH}"

SRCREV = "${AUTOREV}"
SRCREV_FORMAT = "base"

S = "${WORKDIR}/git"

EXTRA_OECMAKE += " ${@bb.utils.contains('DISTRO_FEATURES', 'gtestapp', '-DENABLE_CODE_COVERAGE=ON -DENABLE_UNIT_TESTING=ON', '', d)}"

inherit cmake systemd pkgconfig coverity

DEPENDS = "rbus-core rtmessage"

CFLAGS_append_dunfell = " -Wno-format-truncation "

export RDK_FSROOT_PATH = '${STAGING_DIR_TARGET}'

FILES_${PN}-dev += "${libdir}/cmake"

