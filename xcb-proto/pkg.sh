#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://xcb.freedesktop.org/dist/xcb-proto-1.12.tar.bz2"
    "http://www.linuxfromscratch.org/patches/blfs/8.2/xcb-proto-1.12-python3-1.patch"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/make/}")
}

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    patch -Np1 -i "${SOURCES_DIR}/xcb-proto-1.12-python3-1.patch"
}
