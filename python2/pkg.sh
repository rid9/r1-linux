#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.python.org/ftp/python/2.7.14/Python-2.7.14.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--enable-shared"
        "--with-system-expat"
        "--with-system-ffi"
        "--with-ensurepip=yes"
        "--enable-unicode=ucs4"
    )
}

after_install() {
    $SUDO chmod -v 755 /usr/lib/libpython2.7.so.1.0
}
