#!/bin/sh
##########################################################################
# If not stated otherwise in this file or this component's Licenses.txt
# file the following copyright and licenses apply:
#
# Copyright 2021 RDK Management
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
##########################################################################
if [ -f ${PWD}/../versions.conf ]; then
        sed -i '/meta-/d' ${PWD}/../versions.conf
        sed -i '/hooks/d' ${PWD}/../versions.conf
        sed -i '/openembedded/d' ${PWD}/../versions.conf
        sed -i '/bitbake/d' ${PWD}/../versions.conf
	sed -z -i 's+SRCREV_pn-rdk/components/generic/closedcaption/generic+SRCREV_pn-closedcaption-hal-headers+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/closedcaption/generic+SRCREV_pn-closedcaption+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/ledmgr/generic+SRCREV_pn-ledmgr+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/ledmgr/generic+SRCREV_pn-ledmgr-headers+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/ledmgr/generic+SRCREV_pn-ledmgr-extended-noop+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/trm/generic+SRCREV_pn-trm-common+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/trm/generic+SRCREV_pn-qtapp+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/trm/generic+SRCREV_pn-wsproxy+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/trm/generic+SRCREV_pn-trmmgr+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/devicesettings/generic+SRCREV_pn-devicesettings+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/devicesettings/generic+SRCREV_pn-devicesettings-hal-headers+g' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/hdmicec/generic+SRCREV_pn-hdmicec+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/hdmicec/generic+SRCREV_pn-hdmicecheader+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/iarmmgrs/generic+SRCREV_pn-iarmmgrs+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/iarmmgrs/generic+SRCREV_pn-iarmmgrs-hal-headers+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/media_utils/generic+SRCREV_pn-media-utils+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/media_utils/generic+SRCREV_pn-media-utils-headers+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/tr69hostif/generic+SRCREV_pn-tr69hostif+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/tr69hostif/generic+SRCREV_pn-tr69hostif-headers+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/thirdparty/dimark/tr69-4.4/generic+SRCREV_pn-tr69agent+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/thirdparty/dimark/tr69-4.4/generic+SRCREV_pn-tr69agent-headers+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/audioserver/generic+SRCREV_pn-audioserver+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/audioserver/generic+SRCREV_pn-audioserver-headers+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/audioserver/generic+SRCREV_pn-audioserver-sample-apps+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/rbuscore/generic+SRCREV_pn-rbus-core+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/rbuscore/generic+SRCREV_pn-rtmessage+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/tdk/generic+SRCREV_pn-tdk+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/tdk/generic+SRCREV_pn-installtdk+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/mediaframework/generic+SRCREV_pn-rmfgeneric+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/mediaframework/generic+SRCREV_pn-rmfapp+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/mediaframework/generic+SRCREV_pn-rmfgenericheader+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/mediaframework/generic+SRCREV_pn-rmfgenericheaders+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/mediaframework/generic+SRCREV_pn-trh+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/mediaframework/generic+SRCREV_pn-rtrmfplayer+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/mediaframework/generic+SRCREV_pn-rmfosal+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/mediaframework/generic+SRCREV_pn-sectionfilter-hal-stub+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/mediaframework/generic+SRCREV_pn-runsnmp+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/opensource/qt5_1/generic+SRCREV_pn-qtbase+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/opensource/qt5_1/generic+SRCREV_pn-qtbase-native+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/wifi/generic+SRCREV_pn-wifi-hal-generic+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/wifi/generic+SRCREV_pn-wifi-hal-headers+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/diagnostics/generic+SRCREV_pn-diagnostics-snmp2json+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-rdk/components/generic/diagnostics/generic+SRCREV_pn-rdk-diagnostics+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-components/opensource/RDK_apps+SRCREV_pn-residentui+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-components/opensource/RDK_apps+SRCREV_pn-lxapp-diag+' ${PWD}/../versions.conf
        sed -z -i 's+SRCREV_pn-components/opensource/RDK_apps+SRCREV_pn-lxapp-bt-audio+' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/crashlog/generic+SRCREV_pn-crashlog+g' ${PWD}/../versions.conf
	sed -i 's+SRCREV_pn-rdk/components/generic/gst-plugins-rdk/soc/raspberry/rpi3/playersinkbin+SRCREV_pn-gst-plugins-playersinkbin-raspberry+g' ${PWD}/../versions.conf
	sed -i 's+SRCREV_pn-rdk/components/generic/rtcav/generic+SRCREV_pn-rtcav+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-Comcast/littlesheens.git+SRCREV_pn-littlesheens+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/opensource/qt5_1/soc/broadcom/common+ +g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/storagemanager/generic+SRCREV_pn-storagemanager+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/sys_mon_tools/sys_resource/generic+SRCREV_pn-sys-resource +g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/closedcaption/soc/noop/common+SRCREV_pn-closedcaption-hal-noop+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/sys_mon_tools/key_simulator/generic+SRCREV_pn-key-simulator+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/rfc/generic+SRCREV_pn-rfc+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/control/generic+SRCREV_pn-ctrlm-headers+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-libtom/libtomcrypt.git+SRCREV_pn-libtomcrypt+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/trm/generic+SRCREV_pn-trm-common+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/sys_mon_tools/power-state-monitor/generic+SRCREV_pn-power-state-monitor+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/devices/raspberrypi/devicesettings+SRCREV_pn-devicesettings-hal-raspberrypi+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/ttsengine/generic+SRCREV_pn-tts+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/opensource/qtwebsockets/generic+SRCREV_pn-qtwebsockets+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/yocto_oe/layers/iarmmgrs-hal-sample+SRCREV_pn-iarmmgrs-hal-noop+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/rmf_mediastreamer/generic+SRCREV_pn-rmfstreamer+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/crashupload/generic+SRCREV_pn-crashupload+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/xupnp/generic+SRCREV_pn-xupnp+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/cpc/sec-apis/generic+ +g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/dtcp/generic+SRCREV_pn-dtcpmgr-noop+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/sys_mon_tools/sys_utils/generic+SRCREV_pn-sys-utils+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/mediaframework/soc/raspberrypi/common+SRCREV_pn-rmfhalheaders+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/rdkbrowser/generic+SRCREV_pn-rdkbrowser+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/sysint/devices/raspberrypi+ +g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/hwselftest/generic+SRCREV_pn-hwselftest+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/tr69hostif/generic+SRCREV_pn-tr69hostif +g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/rdkbrowser2/generic+SRCREV_pn-rdkbrowser2+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/appmanager/generic+SRCREV_pn-appmanager+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-components/opensource/westeros+SRCREV_pn-westeros+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/cpc/socprovisioning/soc/cryptanium/common+ +g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/sys_mon_tools/analyzers/scripts/host/generic+SRCREV_pn-analyzers-host+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/dcm/generic+SRCREV_pn-dcmjsonparser+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/sys_mon_tools/si_cache_parser/generic+SRCREV_pn-si-cache-parser+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/rmf_tools/tenableHDCP/soc/broadcom/common+ +g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/sys_mon_tools/mfr_data/generic+SRCREV_pn-mfr-data+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/opensource/base64/generic+SRCREV_pn-base64+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/mocahal/generic+SRCREV_pn-moca-hal+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/sys_mon_tools/rdklogctrl/generic+SRCREV_pn-rdklogctrl+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/dtcp/generic+SRCREV_pn-dtcpmgr-noop+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/iarmbus/generic+SRCREV_pn-iarmbus+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-nanomsg/nanomsg.git+SRCREV_pn-nanomsg+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/breakpad_wrapper/generic+SRCREV_pn-breakpad-wrapper+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/media_interface_lib/soc/broadcom/common+ +g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/lxccpid+SRCREV_pn-lxccpid+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/iarmmgrs/generic+SRCREV_pn-iarmmgrs +g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/cpc/authservice/generic+SRCREV_pn-authservice+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/control-testapp/generic+SRCREV_pn-ctrlm-testapp+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/thirdparty/vnc/generic+ +g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/hdmicec/soc/raspberrypi/rpi3+SRCREV_pn-hdmicec-hal+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/cpc/xre/devices/raspberry/rpi3+ +g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/sec-apis/generic+SRCREV_pn-secapi-noop+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/dcm/generic+SRCREV_pn-dcmjsonparser+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/gstreamer-netflix-platform/generic+SRCREV_pn-rdk-gstreamer-utils+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/media_utils/generic+SRCREV_pn-media-utils+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/opensource/jquery/generic+SRCREV_pn-jquery+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/sec-apis/generic+SRCREV_pn-secapi-noop+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/sys_mon_tools/iarm_set_powerstate/generic+SRCREV_pn-iarm-set-powerstate+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/netmonitor/generic+SRCREV_pn-nlmonitor+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/libSyscallWrapper/generic+SRCREV_pn-libsyswrapper+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/rmf_tools/tenableHDCP/generic+SRCREV_pn-tenablehdcp+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/closedcaption/generic+SRCREV_pn-closedcaption+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/rdkat/generic+SRCREV_pn-rdkat+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/servicemanager/generic+SRCREV_pn-servicemanager+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/sys_mon_tools/mfr_utils/generic+SRCREV_pn-mfr-utils+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/closedcaption/soc/noop/common+SRCREV_pn-closedcaption-hal-noop+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/rbus/generic+SRCREV_pn-rbus+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/gst_svp_ext/generic+SRCREV_pn-gst-svp-ext+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/sys_mon_tools/generate_si_cache/generic+SRCREV_pn-generate-si-cache+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/aampabr+SRCREV_pn-aampabr+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/rdkversion/generic+SRCREV_pn-rdkversion+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/cpc/socprovisioning/generic+SRCREV_pn-socprovisioning-crypto+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/servicemanager/soc/raspberrypi/raspberrypi+ +g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/mediaframework/soc/raspberrypi/common+SRCREV_pn-rmfhalheaders+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/sys_mon_tools/iarm_event_sender/generic+SRCREV_pn-iarm-event-sender+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/syslog_helper/generic+SRCREV_pn-syslog-helper+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/netsrvmgr/generic+SRCREV_pn-netsrvmgr+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/gst-plugins-rdk-aamp+SRCREV_pn-gst-plugins-rdk-aamp+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/injectedbundle/generic+SRCREV_pn-injectedbundle+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/sys_mon_tools/sys_utils/generic+SRCREV_pn-sys-utils+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/cpc/tr69profiles/generic+SRCREV_pn-tr69profiles+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/bluetooth_mgr/generic+SRCREV_pn-bluetooth-mgr+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/bluetooth/generic+SRCREV_pn-bluetooth-core+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/servicemanager/generic+SRCREV_pn-servicemanager+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/rdkmediaplayer/generic+SRCREV_pn-rdkmediaplayer+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-zserge/jsmn.git+SRCREV_pn-jsmn+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/cpc/appmanager/generic+ +g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/aamp+SRCREV_pn-aamp+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/rdm+SRCREV_pn-rdm+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/mediaframework/devices/intel-x86-pc/rdkri+SRCREV_pn-sectionfilter-hal-noop+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/cpc/authservice/devices/raspberrypi+SRCREV_pn-authservice+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/sys_mon_tools/hostdataconverter/generic+SRCREV_pn-hostdataconverter+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/fonts/generic+SRCREV_pn-rdk-fonts+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/rdkapps/generic+ +g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/cpuprocanalyzer+SRCREV_pn-cpuprocanalyzer+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/dca/generic+SRCREV_pn-dca+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/sys_mon_tools/cgroup_memory_utils/generic+ +g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/bluetooth_leAppMgr/generic+SRCREV_pn-bluetooth-leappmgr+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/audiocapturemgr/generic+SRCREV_pn-audiocapturemgr+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/rdk_logger/generic+SRCREV_pn-rdk-logger+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/cpc/sec-apis-crypto/generic+SRCREV_pn-secapi-crypto-brcm+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/gst-plugins-rdk/generic+SRCREV_pn-gst-plugins-rdk+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/sys_mon_tools/iarm_query_powerstate/generic+SRCREV_pn-iarm-query-powerstate+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/cpc/xre/generic+SRCREV_pn-xre-receiver-default+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/sys_mon_tools/analyzers/scripts/target/generic+SRCREV_pn-analyzers-target+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/yocto_oe/layers/devicesettings-hal-sample+SRCREV_pn-devicesettings-hal-noop+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/lxc-container-generator+SRCREV_pn-lxc-container-generator-native+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/control/generic+SRCREV_pn-ctrlm-main+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/thirdparty/dimark/tr69-4.4/generic+SRCREV_pn-tr69agent+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/sysint/generic+SRCREV_pn-sysint+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/generic/fog/generic+SRCREV_pn-fog+g' ${PWD}/../versions.conf
        sed -i 's+SRCREV_pn-rdk/components/cpc/firewall/generic+ +g' ${PWD}/../versions.conf
fi

if [ -f ${PWD}/../versions.conf ]; then
     cat ${PWD}/../versions.conf >> ${PWD}/../auto.conf
fi

if [ -f ${PWD}/../auto.conf ]; then
     sed -i 's/externalsrc//g' ${PWD}/../auto.conf
     sed -i '/EXTERNALSRC_pn/d' ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-audioserver-sample-apps/SRCREV_audioserversampleapps_pn-audioserver-sample-apps/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-audioserver-headers/SRCREV_audioserverheaders_pn-audioserver-headers/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-audioserver /SRCREV_audioserver_pn-audioserver /g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-rdm/SRCREV_rdmgeneric_pn-rdm/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-tdk/SRCREV_tdk_pn-tdk/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-jsmn/SRCREV_jsmn_pn-jsmn/g'  ${PWD}/../auto.conf  
     sed -i 's/SRCREV_pn-aampabr/SRCREV_aamp-abr_pn-aampabr/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-gst-plugins-rdk-aamp/SRCREV_gstplug-rdk-aamp_pn-gst-plugins-rdk-aamp/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-installtdk/SRCREV_tdk_pn-installtdk/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-ctrlm-headers/SRCREV_ctrlm-headers_pn-ctrlm-headers/g' ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-rbus-core/SRCREV_base_pn-rbus-core/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-hwselftest/SRCREV_hwselftest_pn-hwselftest/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-rtmessage/SRCREV_generic_pn-rtmessage/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-libsyswrapper/SRCREV_libsyswrapper_pn-libsyswrapper/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-servicemanagerfunctionaltest/SRCREV_generic_pn-servicemanagerfunctionaltest/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-appmanager/SRCREV_generic_pn-appmanager/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-audiocapturemgr/SRCREV_audiocapturemgr_pn-audiocapturemgr/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-breakpad-wrapper/SRCREV_breakpad_wrapper_pn-breakpad-wrapper/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-ctrlm-testapp/SRCREV_ctrlm-testapp_pn-ctrlm-testapp/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-ctrlm-main/SRCREV_ctrlm-main_pn-ctrlm-main/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-hdmicec /SRCREV_hdmicec_pn-hdmicec /g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-iarmbus/SRCREV_iarmbus_pn-iarmbus/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-iarmmgrs /SRCREV_iarmmgrs_pn-iarmmgrs /g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-rmfgeneric /SRCREV_rmfgeneric_pn-rmfgeneric /g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-nlmonitor/SRCREV_netmonitor_pn-nlmonitor/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-netsrvmgr/SRCREV_netsrvmgr_pn-netsrvmgr/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-rdkbrowser/SRCREV_default_pn-rdkbrowser/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-rfc/SRCREV_rfc_pn-rfc/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-rmfstreamer/SRCREV_rmfmediastreamergeneric_pn-rmfstreamer/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-mfr-utils/SRCREV_mfr-utils_pn-mfr-utils/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-sysint/SRCREV_sysintgeneric_pn-sysint/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-tr69hostif /SRCREV_tr69hostif_pn-tr69hostif /g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-wsproxy/SRCREV_wsproxy_pn-wsproxy/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-xupnp/SRCREV_xupnp_pn-xupnp/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-servicemanager/SRCREV_servicemanager_pn-servicemanager/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-tr69agent /SRCREV_tr69generic_pn-tr69agent /g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-gst-svp-ext/SRCREV_gst_pn-gst-svp-ext/g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-ledmgr /SRCREV_generic_pn-ledmgr /g'  ${PWD}/../auto.conf
     sed -i 's/SRCREV_pn-crashlog/SRCREV_crashlog_pn-crashlog/g' ${PWD}/../auto.conf
fi
