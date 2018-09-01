#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/binutils/binutils-2.30.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--enable-gold"
        "--enable-ld=default"
        "--enable-plugins"
        "--enable-shared"
        "--disable-werror"
        "--enable-64-bit-bfd"
        "--with-system-zlib"
    )

    BUILD_DIR="build"
}

run_make() {
    $* tooldir=/usr
}
