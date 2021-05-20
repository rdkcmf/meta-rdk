# If not stated otherwise in this file or this component's Licenses.txt file the
# following copyright and licenses apply:
#
# Copyright 2016 RDK Management
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

SUMMARY = "C wrapper for breakpad"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"

SRC_URI = "${CMF_GIT_ROOT}/rdk/components/generic/breakpad_wrapper;protocol=${CMF_GIT_PROTOCOL};branch=${CMF_GIT_BRANCH};name=breakpad_wrapper"

DEPENDS_broadband += "breakpad"
DEPENDS_client += "rfc breakpad"
DEPENDS_hybrid += "rfc breakpad"

SRCREV_breakpad_wrapper = "${AUTOREV}"
PV = "${RDK_RELEASE}+git${SRCPV}"

S = "${WORKDIR}/git/"

inherit autotools coverity

CPPFLAGS_append = " \
    -I${STAGING_INCDIR}/breakpad/ \
    "

LDFLAGS_broadband += "-lbreakpad_client -lpthread"
LDFLAGS_client += "-lbreakpad_client -lrfcapi -lpthread"
LDFLAGS_hybrid += "-lbreakpad_client -lrfcapi -lpthread"

do_install_append () {
    # Config files and scripts
    install -d ${D}${includedir}/
    install -D -m 0644 ${S}/*.h ${D}${includedir}/
}


FILES_${PN} += "${libdir}/*.so"
