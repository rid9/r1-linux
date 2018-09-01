#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(freetype)

SOURCE_URLS=(
    "https://www.freedesktop.org/software/fontconfig/release/fontconfig-2.12.6.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--sysconfdir=/etc"
        "--localstatedir=/var"
        "--disable-docs"
        "--docdir=/usr/share/doc/fontconfig-2.12.6"
    )

     rm -f src/fcobjshash.h
}
