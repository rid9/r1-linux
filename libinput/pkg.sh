#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(libevdev mtdev)

SOURCE_URLS=(
    "https://www.freedesktop.org/software/libinput/libinput-1.10.0.tar.xz"
)

before_configure() {
    BUILD_DIR="build"
}

run_configure() {
    meson ${CONFIGURE_FLAGS[@]} \
        -Dudev-dir=/lib/udev \
        -Ddebug-gui=false \
        -Dtests=false \
        -Ddocumentation=false \
        -Dlibwacom=false \
        ..
}

run_make() {
    ninja
}

run_install() {
    $SUDO ninja install
}
