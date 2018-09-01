#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(fontconfig glib cairo)

SOURCE_URLS=(
    "http://ftp.gnome.org/pub/gnome/sources/pango/1.40/pango-1.40.14.tar.xz"
)

before_configure() {
    BUILD_DIR="build"
}

run_configure() {
    meson ${CONFIGURE_FLAGS[@]} \
        --sysconfdir=/etc \
        ..
}

run_make() {
    ninja
}

run_install() {
    $SUDO ninja install
}
