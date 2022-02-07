COMPATIBLE_HOST .= "|mips.*-linux"
FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
SRC_URI += " \
    file://configure_ac.patch \
    file://safe_compile_h.patch \
    file://hotspot.patch \
    "
EXTRA_OECONF_append = " --disable-wchar"

SRCREV = "60786283fd61cd621a5d1df00e083a1c1e3cf52a"
