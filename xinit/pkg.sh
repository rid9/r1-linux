#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.x.org/pub/individual/app/xinit-1.3.4.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--with-xinitdir=/etc/X11/app-defaults"
    )
}

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    sed -e '/$serverargs $vtarg/ s/serverargs/: #&/' \
        -i startx.cpp
}

after_install() {
    $SUDO ldconfig
}
