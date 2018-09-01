#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://downloads.sourceforge.net/project/e2fsprogs/e2fsprogs/v1.43.9/e2fsprogs-1.43.9.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--bindir=/bin"
        '--with-root-prefix=""'
        "--enable-elf-shlibs"
        "--disable-libblkid"
        "--disable-libuuid"
        "--disable-uuidd"
        "--disable-fsck"
    )

    BUILD_DIR="build"
}

run_configure() {
    LIBS="-L/tools/lib" \
    CFLAGS="${CFLAGS} -I/tools/include" \
    PKG_CONFIG_PATH="/tools/lib/pkgconfig" \
    $*
}

after_install() {
    $SUDO make install-libs &&

    $SUDO chmod -v u+w /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a
}
