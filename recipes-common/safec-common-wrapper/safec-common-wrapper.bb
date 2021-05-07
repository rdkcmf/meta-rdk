SUMMARY = "A safec wrapper definition header file"
LICENSE = "CLOSED"

SRC_URI = "file://safec_lib.h"

do_install() {
 install -d ${D}${includedir}
 install -m 0755 ${WORKDIR}/safec_lib.h ${D}${includedir}/
}

#SDK generation fails if there is no default package
ALLOW_EMPTY_${PN} = "1"
