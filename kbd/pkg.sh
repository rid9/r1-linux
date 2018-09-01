#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.kernel.org/pub/linux/utils/kbd/kbd-2.0.4.tar.xz"
    "http://www.linuxfromscratch.org/patches/lfs/8.2/kbd-2.0.4-backspace-1.patch"
)

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    patch -Np1 -i "${SOURCES_DIR}/kbd-2.0.4-backspace-1.patch"
}

before_configure() {
    CONFIGURE_FLAGS+=("--disable-vlock")

    sed -i 's/\(RESIZECONS_PROGS=\)yes/\1no/g' configure &&
    sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in
}

run_configure() {
    PKG_CONFIG_PATH=/tools/lib/pkgconfig $*
}
