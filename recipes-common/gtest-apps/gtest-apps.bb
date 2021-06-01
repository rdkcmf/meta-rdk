# ============================================================================
# RDK MANAGEMENT, LLC CONFIDENTIAL AND PROPRIETARY
# ============================================================================
# This file (and its contents) are the intellectual property of RDK Management, LLC.
# It may not be used, copied, distributed or otherwise  disclosed in whole or in
# part without the express written permission of RDK Management, LLC.
# ============================================================================
# Copyright (c) 2021 RDK Management, LLC. All rights reserved.
# ============================================================================
#

SUMMARY = "To install the script to download gtest apps"
LICENSE = "CLOSED"

FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI = "file://gtest_apps_download.sh"

do_install_append () {
    install -d ${D}/${sbindir}/
    install -m 0777 ${WORKDIR}/gtest_apps_download.sh ${D}${sbindir}/
}
