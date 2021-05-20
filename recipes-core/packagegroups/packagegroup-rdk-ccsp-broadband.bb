SUMMARY = "Custom package group for CCSP bits used in RDK-B"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit packagegroup

PACKAGES = "\
    packagegroup-rdk-ccsp-broadband \
"

# CCSP components used in RDK-B
RDEPENDS_packagegroup-rdk-ccsp-broadband = "\
    rbus-core \
    rbus \ 
    ccsp-common-library \
    ccsp-common-startup \
    utopia \
    ${CM_AGENT} \
    ccsp-cr \
    ccsp-cr-ccsp \
    ccsp-dmcli \
    ccsp-dmcli-ccsp \
    ccsp-home-security \
    ccsp-lm-lite \
    ccsp-lm-lite-ccsp \
    ccsp-adv-security \
    ccsp-xdns \
    ccsp-misc \
    ccsp-misc-ccsp \
    ccsp-eth-agent \
    ccsp-mta-agent \
    ccsp-mta-agent-ccsp \
    ccsp-p-and-m \
    ccsp-moca \
    ccsp-moca-ccsp \
    ccsp-p-and-m-ccsp \
    ccsp-psm \
    ccsp-psm-ccsp \
    ccsp-tr069-pa \
    ccsp-tr069-pa-ccsp \
    sysint-broadband \
    rfc \
    test-and-diagnostic \
    test-and-diagnostic-ccsp \
    ${GWPROVAPP} \
    ${WIFI_AGENT} \
    ccsp-hotspot \
    ccsp-hotspot-kmod \
    ${@bb.utils.contains('DISTRO_FEATURES', 'bci', '', bb.utils.contains('DISTRO_FEATURES', 'webui_jst', 'jst','', d), d)} \    
    ${@bb.utils.contains("DISTRO_FEATURES", "webui_php", "ccsp-webui-csrf", "", d)} \
    ${@bb.utils.contains("DISTRO_FEATURES", "bci", "ccsp-webui-csrf", "", d)} \
    ${@bb.utils.contains("DISTRO_FEATURES", "bridgeUtilsBin", "hal-bridgeutil", "", d)} \
    ccsp-xconf \
    hal-cm \
    hal-dhcpv4c \
    hal-ethsw \
    hal-moca \
    hal-mso_mgmt \
    hal-mta \
    hal-platform \
    hal-vlan \
    hal-wifi \
    ccsp-logagent \
    breakpad-wrapper \
    xupnp \
    parodus \
    parodus2ccsp \
    dca \
    telemetry \
    \
"
RDEPENDS_packagegroup-rdk-ccsp-broadband += "\
    ${@bb.utils.contains("DISTRO_FEATURES", "mlt", "sys-resource", " ", d)} \
    ${@bb.utils.contains('DISTRO_FEATURES', 'bci', 'ccsp-webui-bci', bb.utils.contains('DISTRO_FEATURES', 'webui_jst', 'ccsp-webui-jst','ccsp-webui-php', d), d)} \
"
RDEPENDS_packagegroup-rdk-ccsp-broadband += " ${@bb.utils.contains('DISTRO_FEATURES', 'aker', 'aker', '', d)}"

RDEPENDS_packagegroup-rdk-ccsp-broadband += " ${@bb.utils.contains('DISTRO_FEATURES', 'shorts', 'socat stunnel', '' , d)}"
RDEPENDS_packagegroup-rdk-ccsp-broadband += " ${@bb.utils.contains('DISTRO_FEATURES', 'snmppa', 'ccsp-snmp-pa ccsp-snmp-pa-ccsp', '', d)}"
RDEPENDS_packagegroup-rdk-ccsp-broadband += " ${@bb.utils.contains('DISTRO_FEATURES', 'usppa', "usp-pa", "", d)}"

RDEPENDS_packagegroup-rdk-ccsp-broadband += " ${@bb.utils.contains("DISTRO_FEATURES", "heaptrack", "heaptrack", "", d)}"

DEPENDS += " ccsp-common-library"

WIFI_AGENT ?= "ccsp-wifi-agent"
GWPROVAPP ?= "ccsp-gwprovapp ccsp-gwprovapp-ccsp"
CM_AGENT ?= "ccsp-cm-agent ccsp-cm-agent-ccsp"
