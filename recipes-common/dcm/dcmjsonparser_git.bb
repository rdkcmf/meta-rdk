SUMMARY = "This recipe compiles DCM json parser code base"
SECTION = "console/utils"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"

DEPENDS= "cjson telemetry"
RDEPENDS_${PN} = "cjson"

SRC_URI = "${CMF_GIT_ROOT}/rdk/components/generic/dcm;protocol=${CMF_GIT_PROTOCOL};branch=${CMF_GIT_BRANCH}"

PV = "${RDK_RELEASE}+git${SRCPV}"
SRCREV ?= "${AUTOREV}"
S = "${WORKDIR}/git"

CFLAGS_append = " \
    -I${STAGING_INCDIR} \
    -I${STAGING_INCDIR}/cjson \
"
CFLAGS_append = " -I${STAGING_INCDIR}/ccsp -I${STAGING_INCDIR}/dbus-1.0 -I${STAGING_LIBDIR}/dbus-1.0/include/ "
LDFLAGS_append = " -ltelemetry_msgsender "

inherit autotools systemd coverity
