# Class to inherit when you want to add coverity support .
# Apart from inheriting this class, you need to set COVERITY_REQUIRED needed

export COVERITY_DIR := "${@d.getVar('COVERITY_DIR', True)}"

get_coverity_vars() {
    coverity_blacklist_env="${@d.getVar('COVERITY_BLACKLIST_PATH', True)}" 
    coverity_cmplist_env="${@d.getVar('COVERITY_COMPONENT_BUILD', True)}"
    pn="${@d.getVar('PN', True)}"
    coverity_blacklist_env=`echo "$coverity_blacklist_env" | tr "|" " " | tr "\t" " " | tr -s " "`
    coverity_cmplist_env=`echo "$coverity_cmplist_env" |  tr "|" " " | tr "\t" " " | tr -s " "`
    [ "$coverity_blacklist_env" = "None" ] && coverity_blacklist_env=""
    [ "$coverity_cmplist_env" = "None" ] && coverity_cmplist_env=""

    file="${@d.getVar('FILE',True)}"
    workdir="${@d.getVar('WORKDIR', True)}"
    
    cv_blacklist="$coverity_blacklist_env"
    cv_cmplist="$coverity_cmplist_env"
    cv_exclude="\-native \-cross"
}

do_generate_coverity_build_shell () {
    get_coverity_vars
    coverity=1 

    for i in $cv_exclude; do
      if [ "x`echo $pn | grep "$i" `" != "x" ]; then
          coverity=0
          break
      fi
    done

    if [ "$coverity" = "1" ] ; then
      if [ "x$cv_cmplist" != "x" ]; then
         for i in $cv_cmplist; do
              if [ "x`echo $file | grep "$i" `" != "x" ]; then
                   coverity=1
                   break
              fi
         done
      else
         for i in $cv_blacklist; do
              if [ "x`echo $file | grep "$i" `" != "x" ]; then
                   coverity=0
                   break
              fi
         done
      fi
    fi
    
    if [ "$coverity" = "1" ] ;then
        echo "#### Coverity Analysis Enabled : $file"
    	cov-configure --verbose 4 --config ${WORKDIR}/config/coverity_config.xml --java
    	compiler_options=""
    	extra_option=""
    	compiler_value=`echo ${CC} | cut -f1 -d " "`
	compiler_options=`echo ${CC} | cut -f2- -d " " | sed -e 's/^none//g' | sed 's/^gcc//g'` 
    	if [ "$compiler_options" != "" ];then
       		extra_option="-- $compiler_options"
    	fi
        cov-configure --verbose 4 --config ${WORKDIR}/config/coverity_config.xml --comptype gcc --template --compiler $compiler_value
        return 1
    else
        return 0
    fi    
}

python do_generate_coverity_build()  {
   if d.getVar('COVERITY_REQUIRED', True) == '1':
     try:
       bb.build.exec_func('do_generate_coverity_build_shell', d)
       d.setVar('COVERITYFLAG_${PN}','0')
     except bb.build.FuncFailed:
       d.setVar('COVERITYFLAG_${PN}','1')

     if d.getVar('COVERITYFLAG_${PN}','1') == '1':
           d.setVar('MAKE','cov-build --verbose 4 --config ${WORKDIR}/config/coverity_config.xml --dir ${TOPDIR}/../build-images/${COVERITY_DIR} make ')
     else:
           d.setVar('MAKE','make')
}

do_compile[prefuncs] += "do_generate_coverity_build"

# Ignore Opensource compoments
COVERITY_BLACKLIST_PATH += "openembedded-core | meta-openembedded | meta-rdk-ext"

# Ignore linux kernel Build
COVERITY_BLACKLIST_PATH += "linux-avalanche | linux-yocto-custom | stblinux | rglinux | display-linux-kernel | tsout-linux-kernel"

# Ignore driver componenent
COVERITY_BLACKLIST_PATH += "bbu-kdriver | docsis-headers | docsis | broadcom-refsw | broadcom-moca"

# Ignore problematic components
COVERITY_BLACKLIST_PATH += "avro-c | graphite2 | zilker | wdmp-c | ctrlm-testapp | pxcore-libnode | wpeframework  | mkimage"
COVERITY_BLACKLIST_PATH += "netflix-src | qtbase | syslog-helper"

