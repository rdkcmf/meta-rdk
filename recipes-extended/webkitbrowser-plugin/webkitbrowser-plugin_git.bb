SUMMARY = "WebKitBrowser plugin"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://../LICENSE;md5=16cf2209d4e903e4d5dcd75089d7dfe2"

PR = "r1"
PV = "3.0+git${SRCPV}"

S = "${WORKDIR}/git/WebKitBrowser"

SRC_URI = "git://github.com/rdkcentral/rdkservices.git;protocol=git;branch=main \
  file://0001-Inject-badger-script-source-for-Pluto.patch;patchdir=../ \
  file://0002-Use-SYSLOG-instead-of-TRACE.patch;patchdir=../ \
  file://0003-Increase-browser-creation-timeout.patch;patchdir=../ \
  file://0004-Reduce-BrowserConsoleLog.patch;patchdir=../ \
  file://0005-Enable-mixed-content.patch;patchdir=../ \
  file://0006-Introduce-state-aware-memory-observer.patch;patchdir=../ \
  file://0007-Kill-unresposinve-suspended-web-process-faster.patch;patchdir=../ \
"

# Tip of the main at Jul 29, 2021
SRCREV = "836042da4eaaf2ba7afa43f18c0205220356e030"

inherit cmake pkgconfig python3native

TOOLCHAIN = "gcc"

DEPENDS += "wpeframework wpeframework-tools-native ${WPEWEBKIT}"

PACKAGECONFIG ??= "residentapp searchanddiscoveryapp htmlapp lightningapp aampjsbindings badgerbridge"

PACKAGECONFIG[debug]                 = "-DCMAKE_BUILD_TYPE=Debug,-DCMAKE_BUILD_TYPE=Release,"
PACKAGECONFIG[residentapp]           = "-DPLUGIN_WEBKITBROWSER_RESIDENT_APP=ON,-DPLUGIN_WEBKITBROWSER_RESIDENT_APP=OFF,"
PACKAGECONFIG[searchanddiscoveryapp] = "-DPLUGIN_WEBKITBROWSER_SEARCH_AND_DISCOVERY_APP=ON,-DPLUGIN_WEBKITBROWSER_SEARCH_AND_DISCOVERY_APP=OFF,"
PACKAGECONFIG[htmlapp]               = "-DPLUGIN_WEBKITBROWSER_HTML_APP=ON,-DPLUGIN_WEBKITBROWSER_HTML_APP=OFF,"
PACKAGECONFIG[lightningapp]          = "-DPLUGIN_WEBKITBROWSER_LIGHTNING_APP=ON,-DPLUGIN_WEBKITBROWSER_LIGHTNING_APP=OFF,"
PACKAGECONFIG[aampjsbindings]        = "-DPLUGIN_WEBKITBROWSER_AAMP_JSBINDINGS=ON,-DPLUGIN_WEBKITBROWSER_AAMP_JSBINDINGS=OFF,aamp"
PACKAGECONFIG[badgerbridge]          = "-DPLUGIN_WEBKITBROWSER_BADGER_BRIDGE=ON,-DPLUGIN_WEBKITBROWSER_BADGER_BRIDGE=OFF,"

BROWSER_MEMORYPROFILE ?= "default"

require include/webkitbrowser_properties.inc
require include/webkitbrowser_memorylimits.${BROWSER_MEMORYPROFILE}.inc

EXTRA_OECMAKE += " \
    -DPYTHON_EXECUTABLE=${STAGING_BINDIR_NATIVE}/python3-native/python3 \
    -DCMAKE_SYSROOT=${STAGING_DIR_HOST} \
    -DBUILD_REFERENCE=${SRCREV} \
    -DBUILD_SHARED_LIBS=ON \
    -DPLUGIN_WEBKITBROWSER=ON \
    -DPLUGIN_WEBKITBROWSER_AUTOSTART="${WEBKITBROWSER_AUTOSTART}" \
    -DPLUGIN_WEBKITBROWSER_MEDIADISKCACHE="${WEBKITBROWSER_MEDIADISKCACHE}" \
    -DPLUGIN_WEBKITBROWSER_MEMORYPRESSURE="${WEBKITBROWSER_MEMORYPRESSURE}" \
    -DPLUGIN_WEBKITBROWSER_MEMORYPROFILE="${WEBKITBROWSER_MEMORYPROFILE}" \
    -DPLUGIN_WEBKITBROWSER_MSEBUFFERS="${WEBKITBROWSER_MSEBUFFERS}" \
    -DPLUGIN_WEBKITBROWSER_STARTURL="${WEBKITBROWSER_STARTURL}" \
    -DPLUGIN_WEBKITBROWSER_DISKCACHE="${WEBKITBROWSER_DISKCACHE}" \
    -DPLUGIN_WEBKITBROWSER_XHRCACHE="${WEBKITBROWSER_XHRCACHE}" \
    -DPLUGIN_WEBKITBROWSER_TRANSPARENT="${WEBKITBROWSER_TRANSPARENT}" \
    -DPLUGIN_WEBKITBROWSER_INJECTEBLE_BUNDLE="${WEBKITBROWSER_INJECTEBLE_BUNDLE}" \
    -DPLUGIN_HTML_APP_LOCALSTORAGESIZE="${HTML_APP_LOCALSTORAGESIZE}" \
    -DPLUGIN_LIGHTNING_APP_LOCALSTORAGESIZE="${LIGHTNING_APP_LOCALSTORAGESIZE}" \
    -DPLUGIN_SEARCH_AND_DISCOVERY_APP_LOCALSTORAGESIZE="${SEARCH_AND_DISCOVERY_APP_LOCALSTORAGESIZE}" \
    -DPLUGIN_RESIDENT_APP_LOCALSTORAGESIZE="${RESIDENT_APP_LOCALSTORAGESIZE}" \
    -DPLUGIN_WEBKITBROWSER_LOCALSTORAGESIZE="${WEBKITBROWSER_LOCALSTORAGESIZE}" \
    -DPLUGIN_RESIDENT_APP_CLIENTIDENTIFIER="${RESIDENT_APP_CLIENTIDENTIFIER}" \
    -DPLUGIN_RESIDENT_APP_AUTOSTART="${RESIDENT_APP_AUTOSTART}" \
    -DPLUGIN_RESIDENT_APP_STARTURL="${RESIDENT_APP_STARTURL}" \
    -DPLUGIN_SEARCH_AND_DISCOVERY_APP_CLIENTIDENTIFIER="${SEARCH_AND_DISCOVERY_APP_CLIENTIDENTIFIER}" \
    -DPLUGIN_WEBKITBROWSER_CLIENTIDENTIFIER="${WEBKITBROWSER_CLIENTIDENTIFIER}" \
    -DPLUGIN_HTML_APP_CLIENTIDENTIFIER="${HTML_APP_CLIENTIDENTIFIER}" \
    -DPLUGIN_LIGHTNING_APP_CLIENTIDENTIFIER="${LIGHTNING_APP_CLIENTIDENTIFIER}" \
    -DPLUGIN_HTML_APP_LOCALSTORAGE="${HTML_APP_LOCALSTORAGE}" \
    -DPLUGIN_HTML_APP_COOKIESTORAGE="${HTML_APP_LOCALSTORAGE}" \
    -DPLUGIN_LIGHTNING_APP_LOCALSTORAGE="${LIGHTNING_APP_LOCALSTORAGE}" \
    -DPLUGIN_LIGHTNING_APP_COOKIESTORAGE="${LIGHTNING_APP_LOCALSTORAGE}" \
    -DPLUGIN_SEARCH_AND_DISCOVERY_APP_LOCALSTORAGE="${SEARCH_AND_DISCOVERY_APP_LOCALSTORAGE}" \
    -DPLUGIN_SEARCH_AND_DISCOVERY_APP_COOKIESTORAGE="${SEARCH_AND_DISCOVERY_APP_LOCALSTORAGE}" \
    -DPLUGIN_RESIDENT_APP_LOCALSTORAGE="${RESIDENT_APP_LOCALSTORAGE}" \
    -DPLUGIN_RESIDENT_APP_COOKIESTORAGE="${RESIDENT_APP_LOCALSTORAGE}" \
    -DPLUGIN_WEBKITBROWSER_DISKCACHEDIR="${WEBKITBROWSER_DISKCACHEDIR}" \
    -DPLUGIN_RESIDENT_APP_DISKCACHEDIR="${RESIDENT_APP_DISKCACHEDIR}" \
    -DPLUGIN_SEARCH_AND_DISCOVERY_APP_DISKCACHEDIR="${SEARCH_AND_DISCOVERY_APP_DISKCACHEDIR}" \
    -DPLUGIN_LIGHTNING_APP_DISKCACHEDIR="${LIGHTNING_APP_DISKCACHEDIR}" \
    -DPLUGIN_HTML_APP_DISKCACHEDIR="${HTML_APP_DISKCACHEDIR}" \
    -DPLUGIN_SEARCH_AND_DISCOVERY_APP_SECURE="${SEARCH_AND_DISCOVERY_APP_SECURE}" \
    -DPLUGIN_RESIDENT_APP_SECURE="${RESIDENT_APP_SECURE}" \
    -DPLUGIN_HTML_APP_SECURE="${HTML_APP_SECURE}" \
    -DPLUGIN_LIGHTNING_APP_SECURE="${LIGHTNING_APP_SECURE}" \
    -DPLUGIN_WEBKITBROWSER_SECURE="${WEBKITBROWSER_SECURE}" \
    -DPLUGIN_HTML_APP_PERSISTENTPATHPOSTFIX="${HTML_APP_PERSISTENTPATHPOSTFIX}" \
    -DPLUGIN_LIGHTNING_APP_PERSISTENTPATHPOSTFIX="${LIGHTNING_APP_PERSISTENTPATHPOSTFIX}" \
    -DPLUGIN_RESIDENT_APP_PERSISTENTPATHPOSTFIX="${RESIDENT_APP_PERSISTENTPATHPOSTFIX}" \
    -DPLUGIN_SEARCH_AND_DISCOVERY_APP_PERSISTENTPATHPOSTFIX="${SEARCH_AND_DISCOVERY_APP_PERSISTENTPATHPOSTFIX}" \
    -DPLUGIN_WEBKITBROWSER_PERSISTENTPATHPOSTFIX="${WEBKITBROWSER_PERSISTENTPATHPOSTFIX}" \
"

FILES_SOLIBSDEV = ""
FILES_${PN} += "${libdir}/wpeframework/plugins/*.so ${libdir}/*.so ${datadir}/WPEFramework/*"
FILES_${PN}-dbg += "${datadir}/WPEFramework/WebKitBrowser/.debug"

INSANE_SKIP_${PN} += "libdir staticdev dev-so"
INSANE_SKIP_${PN}-dbg += "libdir"
