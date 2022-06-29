DESCRIPTION = "CPU Proc Analyzer"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"

SRCREV = "${AUTOREV}"
SRC_URI = "${CMF_GIT_ROOT}/rdk/components/generic/cpuprocanalyzer;protocol=${CMF_GIT_PROTOCOL};branch=${CMF_GIT_BRANCH};name=cpuprocanalyzer" 
S = "${WORKDIR}/git"

DEPENDS = "rdk-logger cimplog"
RDEPENDS_${PN} = "rdk-logger"

inherit autotools pkgconfig systemd coverity syslog-ng-config-gen
SYSLOG-NG_FILTER = "cpuprocanalyzer"
SYSLOG-NG_SERVICE_cpuprocanalyzer = "cpuprocanalyzer.service"
SYSLOG-NG_DESTINATION_cpuprocanalyzer = "cpuprocanalyzer.log"
SYSLOG-NG_LOGRATE_cpuprocanalyzer = "low"

do_install_append() {
        install -d ${D}${systemd_unitdir}/system ${D}${sysconfdir}
        install -m 0644 ${S}/conf/cpuprocanalyzer.service ${D}${systemd_unitdir}/system
        install -m 0644 ${S}/conf/cpuprocanalyzer.path ${D}${systemd_unitdir}/system
        install -m 0644 ${S}/conf/procanalyzerconfig.ini ${D}/etc
}

do_install_append_broadband() {
        install -d ${D}${base_libdir}/rdk ${D}{sysconfdir}
        install -m 0755 ${S}/conf/RunCPUProcAnalyzer.sh ${D}${base_libdir}/rdk
}

#SYSTEMD_SERVICE_${PN}  = "cpuprocanalyzer.service"
SYSTEMD_SERVICE_${PN} += "cpuprocanalyzer.path"

FILES_${PN} += "${systemd_unitdir}/system/cpuprocanalyzer.service"
FILES_${PN} += "${systemd_unitdir}/system/cpuprocanalyzer.path"
FILES_${PN} += "/etc/procanalyzerconfig.ini"
FILES_${PN}_append_broadband = " ${base_libdir}/rdk/RunCPUProcAnalyzer.sh"
