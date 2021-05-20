FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"

SRC_URI_append_dunfell = "file://ipbind.patch"
