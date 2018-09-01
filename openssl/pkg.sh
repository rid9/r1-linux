#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://openssl.org/source/openssl-1.1.0g.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--openssldir=/etc/ssl"
        "--libdir=lib"
        "shared"
        "zlib-dynamic"
    )

    CONFIGURE="./config"
}

cmd_install() {
    cmd_make &&

    sed -i '/INSTALL_LIBS/s/libcrypto.a libssl.a//' Makefile &&
    $SUDO make MANSUFFIX=ssl install
}
