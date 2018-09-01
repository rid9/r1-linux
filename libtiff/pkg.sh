#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(cmake)

SOURCE_URLS=(
    "https://download.osgeo.org/libtiff/tiff-4.0.9.tar.gz"
)

before_configure() {
    BUILD_DIR="libtiff-build"
}

run_configure() {
    cmake -DCMAKE_INSTALL_DOCDIR=/usr/share/doc/libtiff-4.0.9 \
          -DCMAKE_INSTALL_PREFIX=/usr -G Ninja ..
}

run_make() {
    ninja
}

run_install() {
    $SUDO ninja install
}
