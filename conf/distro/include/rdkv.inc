
PREFERRED_VERSION_jansson = "2.7"

PREFERRED_VERSION_icu ?= "64.1"
PREFERRED_VERSION_icu-native ?= "64.1"
PREFERRED_VERSION_icu_dunfell ?= "66.1"
PREFERRED_VERSION_icu-native_dunfell ?= "66.1"

PREFERRED_VERSION_curl ?= "7.60.0"
PREFERRED_VERSION_curl-native ?= "7.60.0"
PREFERRED_VERSION_curl_dunfell ?= "7.69.1"
PREFERRED_VERSION_curl-native_dunfell ?= "7.69.1"

PREFERRED_VERSION_openssl = "1.0.2o"
PREFERRED_VERSION_openssl_dunfell = "1.1.1d"

PREFERRED_VERSION_dnsmasq = "2.81"
PREFERRED_VERSION_brotli = "1.0.7"
PREFERRED_VERSION_brotli-native = "1.0.7"

# Disabling Dunfell version of breakpad for timebeing due to DELIA-48240. Till issue is fixed morty version of breakpad will be used in dunfell builds.
PREFERRED_VERSION_breakpad_dunfell = "svn"
PREFERRED_VERSION_breakpad-native_dunfell = "svn"

BBMASK .= "|.*recipes-ccsp|.*recipes-rdkb|.*webpabroadband"

# Build flags to control default SecAPI engine for netflix component
DISTRO_FEATURES_append = " netflix_cryptanium"

BBMASK .= "|meta-rdk-comcast-video/recipes-extended/mediaframework/emu-podserver_git.bb"
BBMASK .= "|meta-rdk-comcast-video/recipes-extended/halsnmp/halsnmp-emu_git.bb"
BBMASK .= "|.meta-rdk-comcast/recipes-common/nvm-sqlite/nvm-sqlite.bb"

# add rdkfwupgrader.bb to bbmask till such time that it supports video devices.
# BBMASK .= "|.meta-rdk-comcast/recipes-extended/rdkfwupgrader/rdkfwupgrader.bb"

# add webconfig-framework.bb to bbmask till such time that it supports Video devices.
BBMASK .= "|.meta-rdk/recipes-common/webconfig-framework/webconfig-framework.bb"

DISTRO_FEATURES_append = " playreadycdmi_cryptanium"
DISTRO_FEATURES_append = " widevine_hardware"

DISTRO_FEATURES_append = " cgroup"

DISTRO_FEATURES_remove = "nfs"

DISTRO_FEATURES_append = " xcal_device"

DISTRO_FEATURES_append = " lxy"

# Flags to control cedm builds
DISTRO_FEATURES_append_rpi = " enable-cpg"
#DISTRO_FEATURES_append_rpi = " use-cpg-source"

DISTRO_FEATURES_append  = " cpg-ecfs"
DISTRO_FEATURES_remove_rpi = "cpg-ecfs"

DISTRO_FEATURES_append  = " bind"
DISTRO_FEATURES_append = " safec"

DISTRO_FEATURES_append = " rdm-versioning"

PREFERRED_VERSION_bluez5_dunfell ?= "5.54"

DISTRO_FEATURES_append = " tigress"
# Masking recipes for CEDM multicall implementation in RDK-V
BBMASK .= "|.config-files|.config-service|.cpgu-src|.cpgu-pbt|.cpgc-src|.cpgc-pbt"


OPTIMIZE_DEFAULT = "-Os"

PREFERRED_VERSION_lighttpd = "1.4.53"

PREFERRED_VERSION_cairo_daisy ?= "1.12.16"
PREFERRED_VERSION_cairo_dunfell ?= "1.16.0"
#Downgrade the cairo version since 1.16.0 is having compatibility issues in Arm devices.
PREFERRED_VERSION_cairo_dunfell_arm = "1.14.6"

PREFERRED_VERSION_systemd_dunfell ?= "1:230%"

VOLATILE_BINDS_append = "/tmp/named.conf.options /etc/bind/named.conf.options\n"
VOLATILE_BINDS_append = "/tmp/bind /var/cache/bind\n"
VOLATILE_BINDS_append = "/tmp/stunnel.conf /etc/stunnel.conf\n"

PREFERRED_VERSION_qtwebsockets = "${@bb.utils.contains('DISTRO_FEATURES', 'build_for_sky', bb.utils.contains('DISTRO_FEATURES', 'comcast_qt5', '5.1.1%', '5.12.3', d), '5.1.1%', d)}"

DISTRO_FEATURES_append  = " logbacktrace"

require conf/distro/include/rdk_backtrace_log.inc

DISTRO_FEATURES_append  = " rdkssa"
#RDKPI-429
DISTRO_FEATURES_remove_rpi = "rdkssa"

#State Red for RDK-V
DISTRO_FEATURES_append  = " redrecovery"
DISTRO_FEATURES_remove_rpi = " redrecovery"

BBMASK .= "${@bb.utils.contains('DISTRO_FEATURES', 'ssl-1.1.1', '|.meta-rdk-ext/recipes-support/stunnel/stunnel_5.56.bbappend|.meta-rdk-video/recipes-support/curl/curl_7.69%.bbappend', '', d)}"
BBMASK .= "${@bb.utils.contains('DISTRO_FEATURES', 'ssl-1.1.1', '|.meta-rdk-ext/recipes-connectivity/openssl/openssl-1.0.2o_1.0.2o.bb', '', d)}"
