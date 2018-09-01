#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.nico.schottelius.org/software/gpm/archives/gpm-1.20.7.tar.bz2"
    "http://www.linuxfromscratch.org/patches/blfs/8.2/gpm-1.20.7-glibc_2.26-1.patch"
)

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    patch -Np1 -i "${SOURCES_DIR}/gpm-1.20.7-glibc_2.26-1.patch"
}

before_configure() {
    CONFIGURE_FLAGS+=("--sysconfdir=/etc")

    sed -i -e 's:<gpm.h>:"headers/gpm.h":' src/prog/{display-buttons,display-coords,get-versions}.c &&
    ./autogen.sh
}

after_install() {
    $SUDO ln -sfv libgpm.so.2.1.0 /usr/lib/libgpm.so &&
    $SUDO install -v -m644 conf/gpm-root.conf /etc
}
