SUMMARY = "This recipe compiles Telemetry"
SECTION = "console/utils"

LICENSE = "CLOSED"
SRC_URI = "${RDK_GENERIC_ROOT_GIT}/telemetry/generic;protocol=${RDK_GIT_PROTOCOL};branch=${RDK_GIT_BRANCH}"

DEPENDS += "curl cjson glib-2.0 breakpad-wrapper rbus"
DEPENDS += "rdk-logger"
RDEPENDS_${PN} += "curl cjson glib-2.0 rbus"

PV = "${RDK_RELEASE}+git${SRCPV}"
SRCREV ?= "${AUTOREV}"
S = "${WORKDIR}/git"

CFLAGS += " -Wall -Werror -Wextra -Wno-unused-parameter -Wno-pointer-sign -Wno-sign-compare -Wno-enum-compare -Wno-type-limits "

CFLAGS_append_dunfell = " -Wno-stringop-overflow -Wno-format-overflow "

inherit pkgconfig autotools systemd pythonnative

LDFLAGS_append = " \
        -lbreakpadwrapper \
        -lpthread \
        -lstdc++ \
        -ldbus-1 \
        "

CXXFLAGS += "-DINCLUDE_BREAKPAD"

do_install_append () {
    install -d ${D}/usr/include/
    install -d ${D}/lib/rdk/
    install -d ${D}${systemd_unitdir}/system
    install -m 644 ${S}/include/telemetry_busmessage_sender.h ${D}/usr/include/
    install -m 644 ${S}/include/telemetry2_0.h ${D}/usr/include/
    install -m 0755 ${S}/source/commonlib/t2Shared_api.sh ${D}${base_libdir}/rdk
    rm -fr ${D}/usr/lib/libtelemetry_msgsender.la 
}

FILES_${PN} += "${libdir}/*.so"
FILES_${PN} += "${base_libdir}/rdk/*"


FILES_SOLIBSDEV = ""
INSANE_SKIP_${PN} += "dev-so"
