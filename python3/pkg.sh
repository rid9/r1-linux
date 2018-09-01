#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.python.org/ftp/python/3.6.4/Python-3.6.4.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--enable-shared"
        "--with-system-expat"
        "--with-system-ffi"
        "--with-ensurepip=yes"
    )
}

after_install() {
    $SUDO chmod -v 755 /usr/lib/libpython3.6m.so &&
    $SUDO chmod -v 755 /usr/lib/libpython3.so
}
