SUMMARY = "IPC bus powering RDK unified bus framework"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=075c59e772e98d304efd052108da3bd7"

SRC_URI = "${CMF_GIT_ROOT}/components/opensource/rbuscore;protocol=${CMF_GIT_PROTOCOL};branch=${CMF_GIT_BRANCH};name=base"
PV = "${RDK_RELEASE}"

SRCREV_base = "${AUTOREV}"

SRCREV_FORMAT = "base"
DEPENDS = "rtmessage msgpack-c"

S = "${WORKDIR}/git"

EXTRA_OECMAKE += " ${@bb.utils.contains('DISTRO_FEATURES', 'gtestapp', '-DBUILD_RBUS_BENCHMARK_TEST=ON -DBUILD_RBUS_UNIT_TEST=ON -DBUILD_RBUS_SAMPLE_APPS=ON', '', d)}"
DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'gtestapp', ' gtest benchmark ', ' ', d)}"

CFLAGS_append_hybrid = " -DRBUS_ALWAYS_ON "
CFLAGS_append_client = " -DRBUS_ALWAYS_ON "

inherit cmake pkgconfig coverity systemd 

FILES_${PN}-dev += "${libdir}/cmake"

do_install_append() {
   install -d ${D}${systemd_unitdir}/system
   install -m 0644 ${S}/conf/rbus.service ${D}${systemd_unitdir}/system
   install -m 0644 ${S}/conf/rbus_session_mgr.service ${D}${systemd_unitdir}/system
}

do_install_append_broadband() {
   install -m 0755 ${S}/conf/rbus_log_capture.sh ${D}${bindir}/
   install -m 0644 ${S}/conf/rbus_log.service ${D}${systemd_unitdir}/system
   install -m 0644 ${S}/conf/rbus_monitor.path ${D}${systemd_unitdir}/system
   install -m 0644 ${S}/conf/rbus_monitor.service ${D}${systemd_unitdir}/system
   install -D -m 0644 ${S}/conf/rbus_rdkb.conf ${D}${systemd_unitdir}/system/rbus.service.d/rbus_rdkb.conf
}

do_install_append_hybrid() {
   install -D -m 0644 ${S}/conf/rbus_rdkv.conf ${D}${systemd_unitdir}/system/rbus.service.d/rbus_rdkv.conf
   install -m 0644 ${S}/conf/rbus_sessmgr_rdkv.service ${D}${systemd_unitdir}/system/rbus_session_mgr.service
}

do_install_append_client() {
   install -D -m 0644 ${S}/conf/rbus_rdkv.conf ${D}${systemd_unitdir}/system/rbus.service.d/rbus_rdkv.conf
   install -m 0644 ${S}/conf/rbus_sessmgr_rdkv.service ${D}${systemd_unitdir}/system/rbus_session_mgr.service
}

PACKAGES =+ "${@bb.utils.contains('DISTRO_FEATURES', 'gtestapp', '${PN}-gtest', '', d)}"
FILES_${PN}-gtest = "\
    ${@bb.utils.contains('DISTRO_FEATURES', 'gtestapp', '${bindir}/rbuscore_gtest.bin', '', d)} \
"

FILES_${PN} += "${systemd_unitdir}/system/*"
SYSTEMD_SERVICE_${PN} = "rbus.service"
SYSTEMD_SERVICE_${PN}_append = " rbus_session_mgr.service "
SYSTEMD_SERVICE_${PN}_append_broadband  = " rbus_log.service "
SYSTEMD_SERVICE_${PN}_append_broadband  = " rbus_monitor.service "
SYSTEMD_SERVICE_${PN}_append_broadband  = " rbus_monitor.path "

DOWNLOAD_APPS="${@bb.utils.contains('DISTRO_FEATURES', 'gtestapp', 'gtestapp-rbuscore', '', d)}"
inherit comcast-package-deploy
CUSTOM_PKG_EXTNS="gtest"
SKIP_MAIN_PKG="yes"
DOWNLOAD_ON_DEMAND="yes"
