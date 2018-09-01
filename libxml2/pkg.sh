#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(libuv curl libarchive)
OPT_DEPS=(icu)

SOURCE_URLS=(
    "http://xmlsoft.org/sources/libxml2-2.9.7.tar.gz"
    "http://www.linuxfromscratch.org/patches/blfs/8.2/libxml2-2.9.7-python3_hack-1.patch"
)

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    patch -Np1 -i "${SOURCES_DIR}/libxml2-2.9.7-python3_hack-1.patch"
}

before_configure() {
    CONFIGURE_FLAGS+=(
        "--disable-static"
        "--with-history"
        "--with-python=/usr/bin/python3"
    )

    sed -i '/_PyVerify_fd/,+1d' python/types.c
}
