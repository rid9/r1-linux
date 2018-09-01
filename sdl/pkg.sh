#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "http://www.libsdl.org/release/SDL-1.2.15.tar.gz"
)

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    sed -e '/_XData32/s:register long:register _Xconst long:' \
        -i src/video/x11/SDL_x11sym.h
}

before_configure() {
    CONFIGURE_FLAGS+=(
        "--disable-static"
        "--enable-video-fbcon"
    )
}
