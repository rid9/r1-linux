#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://downloads.sourceforge.net/freetype/freetype-2.9.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=("--disable-static")

    sed -ri "s:.*(AUX_MODULES.*valid):\1:" modules.cfg &&

    sed -r "s:.*(#.*SUBPIXEL_RENDERING) .*:\1:" \
        -i include/freetype/config/ftoption.h
}
