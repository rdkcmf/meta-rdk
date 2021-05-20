# backtrace logging is enabled
# we set this to "y" or "n" and use it as a conditional later

LOG_BACKTRACE = "${@bb.utils.contains('DISTRO_FEATURES', 'logbacktrace', 'y', 'n', d)}"

BACKTRACE_LDFLAGS ?= ""
BACKTRACE_DEPENDS ?= ""

BACKTRACE_DEPENDS_pn-iarmmgrs = " breakpad-wrapper"
BACKTRACE_DEPENDS_pn-rmfstreamer = " breakpad-wrapper"
BACKTRACE_DEPENDS_pn-rmfpodmgr = " breakpad-wrapper"
BACKTRACE_DEPENDS_pn-tr69hostif = " breakpad-wrapper"
BACKTRACE_DEPENDS_pn-wpeframework = " breakpad-wrapper"
BACKTRACE_DEPENDS_pn-wpa-supplicant = " breakpad-wrapper"
BACKTRACE_DEPENDS_pn-hdmicec = " breakpad-wrapper"
BACKTRACE_DEPENDS_pn-devicesettings = " breakpad-wrapper"

BACKTRACE_LDFLAGS_pn-iarmmgrs = " -lbreakpadwrapper "
BACKTRACE_LDFLAGS_pn-rmfstreamer = " -lbreakpadwrapper "
BACKTRACE_LDFLAGS_pn-rmfpodmgr = " -lbreakpadwrapper "
BACKTRACE_LDFLAGS_pn-tr69hostif = " -Wl,--no-as-needed -lbreakpadwrapper -Wl,--as-needed "
BACKTRACE_LDFLAGS_pn-rdkservices = " -Wl,--no-as-needed -lbreakpadwrapper -Wl,--as-needed "
BACKTRACE_LDFLAGS_pn-cobalt-plugin = " -Wl,--no-as-needed -lbreakpadwrapper -Wl,--as-needed "
BACKTRACE_LDFLAGS_pn-wpeframework-plugin-netflix = " -Wl,--no-as-needed -lbreakpadwrapper -Wl,--as-needed "
BACKTRACE_LDFLAGS_pn-wpa-supplicant = " -Wl,--no-as-needed -lbreakpadwrapper -Wl,--as-needed "
BACKTRACE_LDFLAGS_pn-hdmicec = " -Wl,--no-as-needed -lbreakpadwrapper -Wl,--as-needed "
BACKTRACE_LDFLAGS_pn-devicesettings = " -Wl,--no-as-needed -lbreakpadwrapper -Wl,--as-needed "

BACKTRACE_DEPENDS_pn-busybox = " crashlog"
BACKTRACE_DEPENDS_pn-lighttpd = " crashlog"

BACKTRACE_LDFLAGS_pn-busybox = " -Wl,--no-as-needed -lcrashlog -Wl,--as-needed"
BACKTRACE_LDFLAGS_pn-lighttpd = " -Wl,--no-as-needed -lcrashlog -Wl,--as-needed"


DEPENDS_append = " ${@LOG_BACKTRACE == "y" and BACKTRACE_DEPENDS or ""}"
LDFLAGS_append = " ${@LOG_BACKTRACE == "y" and BACKTRACE_LDFLAGS or ""}"
