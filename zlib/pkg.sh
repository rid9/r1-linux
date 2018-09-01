#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://zlib.net/zlib-1.2.11.tar.xz"
)

after_install() {
    $SUDO mv -v /usr/lib/libz.so.* /lib &&
    $SUDO ln -sfv ../../lib/$(readlink /usr/lib/libz.so) /usr/lib/libz.so
}
