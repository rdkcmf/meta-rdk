#!/bin/sh
DNLD_SCRIPT=/etc/rdm/downloadMgr.sh
RDM_DNLD_PATH=/tmp/rdm/downloads
SCRIPT_PATH=/usr/sbin/debug-tools_download.sh
RDK_LOG_PATH=/rdklogs/logs
VIDEO_DEVICE_LOG_PATH=/opt/logs
LOG_FILE_NAME=debug_tools.log
VALIDATION_METHOD=openssl
PKG_EXT=ipk
TOOL_NAME=$1
APP_NAME_PREFIX=debug_tools-
APP_NAME=$APP_NAME_PREFIX$1
LSOF_PATH=/tmp/debug_tools-lsof/usr/sbin
GPERFTOOLS_PATH=/tmp/debug_tools-gperftools
GPERFTOOLS_BIN_PATH=$GPERFTOOLS_PATH/usr/bin
GPERFTOOLS_LIB_PATH=$GPERFTOOLS_PATH/usr/lib
PERL_PATH=$GPERFTOOLS_LIB_PATH/perl5

# log format
DT_TIME=`date +'%Y-%m-%d:%H:%M:%S:%6N'`
echo_t()
{
    echo "$DT_TIME $@"
}

# Setting log path
if [ -d $RDK_LOG_PATH ];then
    DEBUG_LOG_FILE=$RDK_LOG_PATH/$LOG_FILE_NAME
elif [ -d $VIDEO_DEVICE_LOG_PATH ];then
    DEBUG_LOG_FILE=$VIDEO_DEVICE_LOG_PATH/$LOG_FILE_NAME
else
    DEBUG_LOG_FILE=/tmp/$LOG_FILE_NAME
fi

if [ ! -f $DEBUG_LOG_FILE ]; then
    touch $DEBUG_LOG_FILE
fi

#Set existing path variables if tool name is not mentioned as input
if [ -z $TOOL_NAME ]; then
    echo_t "[DBGTOOLSUPDATE] Tool name not specified, so setting the existing path variables if any" >> $DEBUG_LOG_FILE
    if [ -d $LSOF_PATH ];then
        export PATH=$PATH:$LSOF_PATH
    fi
    if [ -d $GPERFTOOLS_BIN_PATH ];then
        export PATH=$PATH:$GPERFTOOLS_BIN_PATH
        if [ -d $GPERFTOOLS_LIB_PATH ];then
            export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$GPERFTOOLS_LIB_PATH
        fi

        #Setting binutils path
        for dir in $GPERFTOOLS_PATH/usr/*
        do
            if [ $dir != $GPERFTOOLS_BIN_PATH ] && [ $dir != $GPERFTOOLS_LIB_PATH ] ;then
                binutils_path=$dir/bin
                if [ -d $binutils_path ];then
                    export PATH=$PATH:$binutils_path
                fi
            fi
        done
        if [ -d $PERL_PATH ];then
            PERL_VERSION=$(ls $PERL_PATH)
            PERL_LIB_PATH=$PERL_PATH/$PERL_VERSION
            export PERL5LIB=$PERL5LIB:$PERL_LIB_PATH
        fi
    fi
#Cleanup the downloaded debug tools
elif [ $1 == "cleanall" ];then
    #Clean all downloaded debug tools in case tool name not specified
    if [ -z $2 ];then
        umount /tmp/$APP_NAME_PREFIX*
        rm -rf /tmp/$APP_NAME_PREFIX*
        rm -rf $RDM_DNLD_PATH/$APP_NAME_PREFIX*
    #Clean the debug tool specified in input
    else
        umount /tmp/$APP_NAME_PREFIX$2
        rm -rf /tmp/$APP_NAME_PREFIX$2
        rm -rf $RDM_DNLD_PATH/$APP_NAME_PREFIX$2
    fi
#Download the requested debug tool
else
    sh $DNLD_SCRIPT $APP_NAME "" $VALIDATION_METHOD $PKG_EXT ""
    DNLD_RES=$?
    echo_t "[DBGTOOLSUPDATE] DebugTools $APP_NAME download result is:$DNLD_RES" >> $DEBUG_LOG_FILE
    if [ $DNLD_RES -eq 0 ]; then
        echo_t "[DBGTOOLSUPDATE] DebugTools $APP_NAME download successful, setting path variables" >> $DEBUG_LOG_FILE
        if [ $TOOL_NAME == "lsof" ];then
            export PATH=$PATH:$LSOF_PATH
        elif [ $TOOL_NAME == "gperftools" ];then
            export PATH=$PATH:$GPERFTOOLS_BIN_PATH
            if [ -d $GPERFTOOLS_LIB_PATH ];then
                export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$GPERFTOOLS_LIB_PATH
            fi

            #Setting binutils path
            for dir in $GPERFTOOLS_PATH/usr/*
            do
                if [ $dir != $GPERFTOOLS_BIN_PATH ] && [ $dir != $GPERFTOOLS_LIB_PATH ] ;then
                    binutils_path=$dir/bin
                    if [ -d $binutils_path ];then
                        export PATH=$PATH:$binutils_path
                    fi
                fi
            done
            #Correcting the links to binutils
            for fname in addr2line objdump nm c++filt
            do
                linktarget=$(readlink $GPERFTOOLS_BIN_PATH/$fname)
                sourcefile=$GPERFTOOLS_PATH$linktarget
                symblink=$GPERFTOOLS_BIN_PATH/$fname
                ln -sf $sourcefile $symblink
            done
            if [ -d $PERL_PATH ];then
                PERL_VERSION=$(ls $PERL_PATH)
                PERL_LIB_PATH=$PERL_PATH/$PERL_VERSION
                export PERL5LIB=$PERL5LIB:$PERL_LIB_PATH
            fi
        else
            echo_t "[DBGTOOLSUPDATE] Requested Debug tool not supported: $APP_NAME download failed" >> $DEBUG_LOG_FILE
        fi
    else
        echo_t "[DBGTOOLSUPDATE] DebugTools $APP_NAME download failed" >> $DEBUG_LOG_FILE
    fi
fi
