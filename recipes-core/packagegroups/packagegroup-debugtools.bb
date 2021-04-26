SUMMARY = "Custom package group for Debugtools"

LICENSE = "MIT"

inherit packagegroup

PACKAGES = "\
    packagegroup-debugtools \
    "

#To install the script for downloading debugtools
RDEPENDS_${PN} = "\
  debug-tools \
  "

#Debug tools and its dependencies
DEPENDS = "\
  lsof \
  gperftools \
  binutils \
  "

