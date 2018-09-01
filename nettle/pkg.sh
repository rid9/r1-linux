#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/nettle/nettle-3.4.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--disable-static")
}

after_install() {
    $SUDO chmod -v 755 /usr/lib/lib{hogweed,nettle}.so
}
