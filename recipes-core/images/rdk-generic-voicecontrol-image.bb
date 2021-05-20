SUMMARY = "A console-only image for the RDK-X yocto build"

inherit rdk-image

IMAGE_FEATURES[validitems] += "voicecontrol"
IMAGE_FEATURES += "voicecontrol"

LICENSE = "RDK"
LIC_FILES_CHKSUM = "file://${COREBASE}/../meta-rdk-restricted/licenses/RDK;md5=ba986f8eaa991d86ab2ab6f837701a5f"

python __anonymous () {
    if "rdkx" not in d.getVar('OVERRIDES', True):
        raise bb.parse.SkipPackage("Image is meant for rdkx class of devices")
}
