# eSDK distro Changes
INHERIT_append = " uninative image-buildinfo"
include  conf/distro/include/yocto-uninative.inc
SDK_INCLUDE_NATIVESDK = "1"
BB_SETSCENE_ENFORCE_WHITELIST_append = " %:* *:do_fetch *"
IMGCLASSES += "populate_sdk_ext"
SDK_EXT_TYPE ?= "full"

