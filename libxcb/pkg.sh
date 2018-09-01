#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(xcb-proto libxau)

SOURCE_URLS=(
    "https://xcb.freedesktop.org/dist/libxcb-1.12.tar.bz2"
    "http://www.linuxfromscratch.org/patches/blfs/8.2/libxcb-1.12-python3-1.patch"
)

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    patch -Np1 -i "${SOURCES_DIR}/libxcb-1.12-python3-1.patch"
}

before_configure() {
    CONFIGURE_FLAGS+=(
        "--enable-xinput"
        "--without-doxygen"
        "--docdir=/usr/share/doc/libxcb-1.12"
    )

    sed -i "s/pthread-stubs//" configure
}
