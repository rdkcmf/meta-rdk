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

DESCRIPTION = "CPU Proc Analyzer"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"

SRCREV = "${AUTOREV}"
SRC_URI = "${CMF_GIT_ROOT}/rdk/components/generic/cpuprocanalyzer;protocol=${CMF_GIT_PROTOCOL};branch=${CMF_GIT_BRANCH};name=cpuprocanalyzer" 
S = "${WORKDIR}/git"

DEPENDS = "rdk-logger cimplog"
RDEPENDS_${PN} = "rdk-logger"

inherit autotools pkgconfig systemd coverity

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
