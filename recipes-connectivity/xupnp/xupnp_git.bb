SUMMARY = "Upnp based discovery services to discover the gateways, media content providers in the home network."
SECTION = "console/utils"

LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://LICENSE;md5=175792518e4ac015ab6696d16c4f607e"

PV = "${RDK_RELEASE}"
SRCREV_FORMAT = "xupnp"

SRC_URI = "${CMF_GIT_ROOT}/rdk/components/generic/xupnp;protocol=${CMF_GIT_PROTOCOL};branch=${CMF_GIT_BRANCH};name=xupnp"
SRCREV_xupnp = "${AUTOREV}"

S = "${WORKDIR}/git"

DEPENDS = "glib-2.0 gupnp fcgi dbus gnutls libgcrypt"
FILES_${PN} += "${libdir}/"

CFLAGS += " -Wall -Werror -Wextra -Wno-pointer-sign -Wno-sign-compare -Wno-deprecated-declarations -Wno-type-limits -Wno-unused-parameter -Wno-lto-type-mismatch "

CFLAGS_append_dunfell = " -Wno-format-truncation "

DEPENDS = "glib-2.0 gupnp fcgi dbus gnutls rdk-logger libgcrypt libgpg-error "

DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'safec', ' safec', " ", d)}"
DEPENDS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'telemetry2_0', 'telemetry', '', d)}"

DEPENDS_append_dunfell = " libgcrypt libgpg-error"

PACKAGECONFIG = "gupnp1.2 dbus"
PACKAGECONFIG[gupnp1.2] = "--enable-version1.2,,,"
PACKAGECONFIG[gupnp0.2] = "--enable-version0.2,,,"
PACKAGECONFIG[gupnp0.2-dfl] = "--enable-version0.2-dfl,,,"
PACKAGECONFIG[gupnp-legacy] = "--enable-version0.9,,,"
PACKAGECONFIG[dbus] = "--enable-dbus,,,"
PACKAGECONFIG[client] = "--enable-client-xcal-server,,,"

PACKAGECONFIG_append_client = " client"

PACKAGECONFIG_remove_morty = "gupnp1.2"
PACKAGECONFIG_append_morty = " gupnp0.2"
PACKAGECONFIG_remove_daisy = "gupnp1.2"
PACKAGECONFIG_append_daisy = " gupnp0.2"

PACKAGECONFIG_remove_dunfell = "gupnp1.2"
PACKAGECONFIG_append_dunfell = " gupnp0.2-dfl"

EXTRA_OECONF += " --sysconfdir=${sysconfdir}/xupnp"

inherit autotools systemd pkgconfig coverity
YOCTO_VER_DUNFELL = "${@ bb.utils.contains('DISTRO_FEATURES', 'dunfell', 1, 0, d) }"
SAFEC_VER =  "${@ "safec-3.5.1" if ${YOCTO_VER_DUNFELL} else "safec-3.5" }"

CFLAGS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'safec', ' `pkg-config --cflags libsafec`', ' -fPIC', d)}"
CFLAGS_client_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'safec', ' `pkg-config --cflags libsafec`', ' -fPIC', d)}"
CXXFLAGS_append = " -fPIC "
LDFLAGS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'safec', ' `pkg-config --libs libsafec`', '', d)}"
CFLAGS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'safec', '', ' -DSAFEC_DUMMY_API', d)}"
CFLAGS_append = " -I${STAGING_INCDIR}/ccsp "
CFLAGS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'telemetry2_0', '-DENABLE_FEATURE_TELEMETRY2_0', '', d)} "
LDFLAGS_append = " ${@bb.utils.contains('DISTRO_FEATURES', 'telemetry2_0', ' -ltelemetry_msgsender ', '', d)} "
CFLAGS_append = " -DLOGMILESTONE"
LDFLAG_append = " -lrdkloggers"

PACKAGES += "${@bb.utils.contains('DISTRO_FEATURES', 'gtestapp', '${PN}-gtest', '', d)}"

FILES_${PN}-gtest = "\
    ${@bb.utils.contains('DISTRO_FEATURES', 'gtestapp', '${bindir}/xupnp_gtest.bin', '', d)} \
"

FILES_${PN} = "\
    ${bindir}/xdiscovery \
    ${bindir}/xcal-device \
    ${sysconfdir}/* \
"

DOWNLOAD_APPS="${@bb.utils.contains('DISTRO_FEATURES', 'gtestapp', 'gtestapp-xupnp', '', d)}"
inherit comcast-package-deploy
CUSTOM_PKG_EXTNS="gtest"
SKIP_MAIN_PKG="yes"
DOWNLOAD_ON_DEMAND="yes"
