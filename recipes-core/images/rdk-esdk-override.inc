do_populate_sdk_ext_prepend() {
    builddir = d.getVar('TOPDIR')
    if os.path.exists(builddir + '/conf/templateconf.cfg'):
        with open(builddir + '/conf/templateconf.cfg', 'w') as f:
            f.write('meta/conf\n')
}


#Define RDKROOT for eSDK environment
python copy_buildsystem_append() {
    baseoutpath = d.getVar('SDK_OUTPUT') + '/' + d.getVar('SDKPATH')
    with open(baseoutpath + '/conf/bblayers.conf', 'a') as f:
        f.write('RDKROOT = "$' + '{TOPDIR}/layers" \n' )
}

