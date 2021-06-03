#Currently moving only firebolt related content to common space
#This is imported by both hybrid and mediaclient video devices.
#So all common code can be moved to this place.

TOOLCHAIN_TARGET_TASK_append  =" breakpad-staticdev alsa-dev egl-headers"
USER_PREFERRED_SDK_INSTALL_DIR = "./RNE-3.0"
#changes made for populating SDK
TOOLCHAIN_OUTPUTNAME="${MACHINE}-RNE-SDK-${SDK_VERSION}"
SDKIMAGE_FEATURES_remove ="dbg-pkgs"
SDKIMAGE_FEATURES_remove ="src-pkgs"
POPULATE_SDK_POST_TARGET_COMMAND += 'do_rdk_artifact_customizations; '

TOOLCHAIN_HOST_TASK_append_daisy = "\
   nativesdk-python-core \
   nativesdk-python-textutils \
   nativesdk-python-sqlite3 \
   nativesdk-python-pickle \
   nativesdk-python-logging \
   nativesdk-python-elementtree \
   nativesdk-python-curses \
   nativesdk-python-compile \
   nativesdk-python-compiler \
   nativesdk-python-fcntl \
   nativesdk-python-shell \
   nativesdk-python-misc \
   nativesdk-python-multiprocessing \
   nativesdk-python-subprocess \
   nativesdk-python-xmlrpc \
   nativesdk-python-netclient \
   nativesdk-python-netserver \
   nativesdk-python-distutils \
   nativesdk-python-unixadmin \
   nativesdk-python-compression \
   nativesdk-python-json \
   nativesdk-python-unittest \
   nativesdk-python-mmap \
   nativesdk-python-difflib \
   nativesdk-python-pprint \
   nativesdk-python-git \
   nativesdk-python-pkgutil \
   "
TOOLCHAIN_HOST_TASK_append = " nativesdk-bison"
TOOLCHAIN_TARGET_TASK_append  =" devicesettings-hal-headers rt-headers"

do_populate_sdk_ext_prepend() {
    builddir = d.getVar('TOPDIR')
    if os.path.exists(builddir + '/conf/templateconf.cfg'):
        with open(builddir + '/conf/templateconf.cfg', 'w') as f:
            f.write('meta/conf\n')
}

copy_buildsystem_append() {
        baseoutpath = d.getVar('SDK_OUTPUT') + '/' + d.getVar('SDKPATH')
        with open(baseoutpath + '/conf/bblayers.conf', 'a') as f:
            f.write('RDKROOT = "$' + '{TOPDIR}/layers/openembedded-core" \n' )
}

