SUMMARY = "This receipe compiles Network link Monitoring codebase."
SECTION = "console/utils"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"

SRC_URI = "${CMF_GIT_ROOT}/rdk/components/generic/netmonitor;protocol=${CMF_GIT_PROTOCOL};branch=${CMF_GIT_BRANCH};name=netmonitor"
SRCREV_netmonitor = "${AUTOREV}"

SRCREV_FORMAT = "netmonitor"

PV = "${RDK_RELEASE}+git${SRCPV}"

S = "${WORKDIR}/git"

DEPENDS = "libnl"

inherit autotools pkgconfig systemd coverity

do_install_append () {
   install -d ${D}/lib/rdk
   install -d ${D}${sysconfdir}
   install -d ${D}/${systemd_unitdir}/system
   install ${S}/checkDefaultRoute.sh ${D}/lib/rdk
   install ${S}/printaddress.sh ${D}/lib/rdk
   install ${S}/printroute.sh ${D}/lib/rdk
   install ${S}/nlmon.service ${D}/${systemd_unitdir}/system
}

do_install_append_hybrid () {
   install ${S}/nlmon_hybrid.cfg ${D}${sysconfdir}/nlmon.cfg
}

do_install_append_client () {
   install ${S}/ipv6addressChange.sh ${D}/lib/rdk
   install ${S}/nlmon_client.cfg ${D}${sysconfdir}/nlmon.cfg
}

FILES_${PN} += "${systemd_unitdir}/system/* \
               /lib/rdk/checkDefaultRoute.sh \
               /lib/rdk/printaddress.sh \
               /lib/rdk/printroute.sh \
               ${sysconfdir}/nlmon.cfg \
               "
FILES_${PN}_append_client += "/lib/rdk/ipv6addressChange.sh \
                             "
SYSTEMD_SERVICE_${PN} = "nlmon.service"
