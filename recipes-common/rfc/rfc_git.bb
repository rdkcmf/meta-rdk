SUMMARY = "RFC helper applications"
SECTION = "console/utils"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"

PACKAGECONFIG ??= "rfctool"
PACKAGECONFIG[rfctool] = "--enable-rfctool=yes"

SRC_URI = "${CMF_GIT_ROOT}/rdk/components/generic/rfc;protocol=${CMF_GIT_PROTOCOL};branch=${CMF_GIT_BRANCH};name=rfc"

S = "${WORKDIR}/git"
PV = "${RDK_RELEASE}+git${SRCPV}"
SRCREV_rfc = "${AUTOREV}"
SRCREV_FORMAT = "rfc"

export cjson_CFLAGS = "-I$(PKG_CONFIG_SYSROOT_DIR)${includedir}/cjson"
export cjson_LIBS = "-lcjson"

DEPENDS="cjson curl"
EXTRA_OEMAKE += "-e MAKEFLAGS="

inherit autotools pkgconfig coverity

CFLAGS += " -Wall -Werror -Wextra "

do_install_append () {
	install -d ${D}${base_libdir}/rdk
        install -d ${D}${sysconfdir}

        install -m 0755 ${S}/RFCbase.sh ${D}${base_libdir}/rdk
        install -m 0755 ${S}/rfcInit.sh ${D}${base_libdir}/rdk
        install -m 0755 ${S}/RFCpostprocess.sh ${D}${base_libdir}/rdk
        install -m 0644 ${S}/rfc.properties ${D}${sysconfdir}
	install -m 0755 ${S}/RFC_Reboot.sh ${D}${sysconfdir}/RFC_Reboot.sh
}

RDEPENDS_${PN} += "busybox"

FILES_${PN} += "${bindir}/rfctool"
FILES_${PN} += "${base_libdir}/*"
FILES_${PN} += "${sysconfdir}/*"
