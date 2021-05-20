DESCRIPTION = "Network Hotplug"
LICENSE = "Apache-2.0"
LIC_FILES_CHKSUM = "file://${COREBASE}/../meta-rdk/licenses/Apache-2.0;md5=3b83ef96387f14655fc854ddc3c6bd57"

SRC_URI = " \
           file://network@.service \
           file://udhcpc@.service \
           file://network.rules \
           file://lan-iface@.service \
          "

FILES_${PN} = "${sysconfdir}/udev/rules.d/* ${base_libdir}/systemd/system/*"
RDEPENDS_${PN} = "udev"

do_install() {
	install -d ${D}${base_libdir}/systemd/system
	install -m 0644 ${WORKDIR}/*.service ${D}${base_libdir}/systemd/system

	install -d ${D}${sysconfdir}/udev/rules.d
	install -m 0644 ${WORKDIR}/network.rules ${D}${sysconfdir}/udev/rules.d/network.rules
}

inherit systemd
