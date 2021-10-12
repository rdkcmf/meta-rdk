SUMMARY = "bluetooth-leAppMgr"
SECTION = "console/utils"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"

PV = "${RDK_RELEASE}+git${SRCPV}"

SRCREV = "${AUTOREV}"
SRCREV_FORMAT = "bluetooth-leappmgr"

SRC_URI = "${RDK_GENERIC_ROOT_GIT}/bluetooth_leAppMgr/generic;protocol=${RDK_GIT_PROTOCOL};branch=${RDK_GIT_BRANCH}"
S = "${WORKDIR}/git"

DEPENDS = "bluetooth-mgr cjson"

# RPC Must be Enabled for Video Platforms only; Not for XB platforms. Also iarmbus is dependency for Video Platforms
DEPENDS_append_client = " iarmbus"
DEPENDS_append_hybrid = " iarmbus"

DEPENDS += " rdk-logger"
DEPENDS += " rfc"
DEPENDS += " iarmbus tr69hostif-headers"

RDEPENDS_${PN}  = " bluetooth-mgr"
RDEPENDS_${PN} += " cjson"
RDEPENDS_${PN} += " rdk-logger"


inherit autotools pkgconfig systemd coverity syslog-ng-config-gen
SYSLOG-NG_FILTER = "btrLeAppMgr"
SYSLOG-NG_SERVICE_btrLeAppMgr = "btrLeAppMgr.service"
SYSLOG-NG_DESTINATION_btrLeAppMgr = "btrLeAppMgr.log"
SYSLOG-NG_LOGRATE_btrLeAppMgr = "medium"

ENABLE_RDK_LOGGER = "--enable-rdk-logger=${@bb.utils.contains('RDEPENDS_${PN}', '${MLPREFIX}rdk-logger', 'yes', 'no', d)}"
EXTRA_OECONF += " ${ENABLE_RDK_LOGGER}"

do_install_append() {
	install -d ${D}${systemd_unitdir}/system ${D}${sysconfdir}
    install -m 0755 ${S}/conf/startBtrLeAppMgr.sh ${D}${bindir}
    install -m 0644 ${S}/conf/btrLeAppMgr.service ${D}${systemd_unitdir}/system
}

SYSTEMD_SERVICE_${PN}  = "btrLeAppMgr.service"

FILES_${PN} += "${systemd_unitdir}/system/btrLeAppMgr.service"

