# ============================================================================
# RDK MANAGEMENT, LLC CONFIDENTIAL AND PROPRIETARY
# ============================================================================
# This file (and its contents) are the intellectual property of RDK Management, LLC.
# It may not be used, copied, distributed or otherwise  disclosed in whole or in
# part without the express written permission of RDK Management, LLC.
# ============================================================================
# Copyright (c) 2020 RDK Management, LLC. All rights reserved.
# ============================================================================
#
SUMMARY = "To install the script to download debug-tools"
LICENSE = "CLOSED"

SRC_URI = "file://debug-tools_download.sh"

do_install_append () {
        install -d ${D}/${sbindir}/
        install -m 0777 ${WORKDIR}/debug-tools_download.sh ${D}${sbindir}/

}

