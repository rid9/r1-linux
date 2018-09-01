#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(glib gobject-introspection)

SOURCE_URLS=(
    "https://ftp.gnome.org/pub/gnome/sources/atk/2.26/atk-2.26.1.tar.xz"
)

before_configure() {
    BUILD_DIR="build"
}

run_configure() {
    meson ${CONFIGURE_FLAGS[@]} ..
}

run_make() {
    ninja
}

run_install() {
    $SUDO ninja install
}
