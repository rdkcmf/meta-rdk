SUMMARY = "Custom package group for TDK-C"

LICENSE = "MIT"

inherit packagegroup

PACKAGES = "\
    packagegroup-tdk-camera \
    "

#components used in TDK-C
RDEPENDS_packagegroup-tdk = "\
  tdk-c \
  sysstat \
  sed \
  "
