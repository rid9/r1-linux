#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://downloads.xiph.org/releases/ogg/libogg-1.3.3.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--disable-static"
        "--docdir=/usr/share/doc/libogg-1.3.3"
    )
}
