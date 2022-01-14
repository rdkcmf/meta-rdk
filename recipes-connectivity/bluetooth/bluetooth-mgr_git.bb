SUMMARY = "bluetooth-mgr"
SECTION = "console/utils"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"

PV = "${RDK_RELEASE}+git${SRCPV}"

SRCREV = "${AUTOREV}"
SRCREV_FORMAT = "bluetooth-mgr"

SRC_URI = "${CMF_GIT_ROOT}/rdk/components/generic/bluetooth_mgr;protocol=${CMF_GIT_PROTOCOL};branch=${CMF_GIT_BRANCH}"
S = "${WORKDIR}/git"

DEPENDS = "bluetooth-core cjson virtual/media-utils"
DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'gstreamer1', 'gstreamer1.0 gstreamer1.0-plugins-base', '', d)}"

ENABLE_GST1 = "--enable-gstreamer1=${@bb.utils.contains('DISTRO_FEATURES', 'gstreamer1', 'yes', 'no', d)}"
EXTRA_OECONF = " ${ENABLE_GST1}"

# RPC Must be Enabled for Video Platforms only; Not for XB platforms. Also iarmbus is dependency for Video Platforms
DEPENDS_append_client = " iarmbus netsrvmgr"
DEPENDS_append_hybrid = " iarmbus"
EXTRA_OECONF_append_hybrid = " --enable-rpc"
EXTRA_OECONF_append_client = " --enable-rpc"

DEPENDS += " fcgi"
DEPENDS += " virtual/media-utils"
DEPENDS += " audiocapturemgr"
DEPENDS += " rdk-logger"
DEPENDS += " rfc"

RDEPENDS_${PN}  = " bluetooth-core"
RDEPENDS_${PN} += " virtual/media-utils"
RDEPENDS_${PN} += " cjson"
RDEPENDS_${PN} += " audiocapturemgr"
RDEPENDS_${PN} += " rdk-logger"


inherit autotools pkgconfig systemd coverity syslog-ng-config-gen
SYSLOG-NG_FILTER = "btmgr"
SYSLOG-NG_SERVICE_btmgr = "btmgr.service"
SYSLOG-NG_DESTINATION_btmgr = "btmgrlog.txt"
SYSLOG-NG_LOGRATE_btmgr = "very-high"

ENABLE_AC_RMF = "--enable-ac_rmf=${@bb.utils.contains('RDEPENDS_${PN}', 'virtual/media-utils', 'yes', 'no', d)}"
ENABLE_ACM = "--enable-acm=${@bb.utils.contains('RDEPENDS_${PN}', 'audiocapturemgr', 'yes', 'no', d)}"
EXTRA_OECONF += " ${ENABLE_ACM} ${ENABLE_AC_RMF}"

CFLAGS_append =" ${@bb.utils.contains('RDEPENDS_${PN}', 'audiocapturemgr', ' -I${STAGING_INCDIR}/audiocapturemgr', " ", d)}"
CFLAGS_append =" ${@bb.utils.contains('RDEPENDS_${PN}', 'virtual/media-utils', ' -I${STAGING_INCDIR}/media-utils -I${STAGING_INCDIR}/media-utils/audioCapture', " ", d)}"

ENABLE_RDK_LOGGER = "--enable-rdk-logger=${@bb.utils.contains('RDEPENDS_${PN}', 'rdk-logger', 'yes', 'no', d)}"
EXTRA_OECONF += " ${ENABLE_RDK_LOGGER}"

EXTRA_OECONF_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '--enable-systemd-notify', '', d)}"
EXTRA_OECONF_append_client = " --enable-sys-diag"

do_install_append() {
	install -d ${D}${systemd_unitdir}/system ${D}${sysconfdir}
    install -m 0644 ${S}/conf/btmgr.service ${D}${systemd_unitdir}/system
}

SYSTEMD_SERVICE_${PN}  = "btmgr.service"

FILES_${PN} += "${systemd_unitdir}/system/btmgr.service"

