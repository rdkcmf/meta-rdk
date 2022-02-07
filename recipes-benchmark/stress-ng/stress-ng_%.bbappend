FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

inherit systemd  
SRC_URI += "file://stress-ng-tests.sh \
            file://rdk_oss_uploadSTBLogs.sh \
            file://stress-test.service \
            file://vmstat.patch \
            file://child_detail.patch \
            file://fwversion_mac.patch \
            "
            
#SYSTEMD_SERVICE_${PN} = "stress-ng-test.path stress-ng-test.service"

do_install_append() {
    install -d ${D}/lib/rdk
    install -d ${D}${systemd_unitdir}/system
    install -m 0755 ${WORKDIR}/stress-ng-tests.sh ${D}/lib/rdk
    install -m 0755 ${WORKDIR}/rdk_oss_uploadSTBLogs.sh ${D}/lib/rdk
    install -m 0644 ${WORKDIR}/stress-test.service ${D}${systemd_unitdir}/system
}

FILES_${PN} += " /lib/rdk/stress-ng-tests.sh " 
FILES_${PN} += " /lib/rdk/rdk_oss_uploadSTBLogs.sh" 
FILES_${PN} += "${systemd_unitdir}/system/stress-test.service"
