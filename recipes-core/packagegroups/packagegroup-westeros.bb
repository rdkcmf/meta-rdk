# Copyright (C) 2016 Khem Raj <raj.khem@gmail.com>
# Released under the MIT license

DESCRIPTION = "Westeros packages"

LICENSE = "MIT"
LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"

inherit packagegroup

PACKAGES = "\
    packagegroup-westeros \
"

RDEPENDS_packagegroup-westeros = "\
    westeros \
    westeros-simplebuffer \
    westeros-simpleshell \
    westeros-sink \
    westeros-soc \
    ${WESTEROS_RENDERER} \
"

WESTEROS_RENDERER ?= ""

WESTEROS_RENDERER_rpi = "\
    westeros-render-dispmanx \
"
