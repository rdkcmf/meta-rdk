SUMMARY = "This recipes is used to compile and install rtmessage component"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"

SRC_URI = "${CMF_GIT_ROOT}/rdk/components/opensource/rtmessage;protocol=${CMF_GIT_PROTOCOL};branch=${CMF_GIT_BRANCH};name=generic"

SRCREV = "${AUTOREV}"
SRCREV_FORMAT = "base"

DEPENDS = "cjson rdk-logger"

S = "${WORKDIR}/git"

EXTRA_OECMAKE += "-DRDKC_BUILD=OFF -DENABLE_RDKLOGGER=ON -DBUILD_DATAPROVIDER_LIB=OFF -DBUILD_DMCLI=OFF -DBUILD_DMCLI_SAMPLE_APP=OFF "

inherit cmake coverity

FILES_${PN}-dev = "${includedir}/"
FILES_${PN} += "${libdir}/"
FILES_${PN} += "${bindir}/"
FILES_${PN}-dev += "${libdir}/cmake"

CFLAGS += " -Wall -Werror -Wextra -Wno-unused-parameter "

