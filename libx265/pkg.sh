#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(cmake yasm)

SOURCE_URLS=(
    "https://bitbucket.org/multicoreware/x265/downloads/x265_2.6.tar.gz"
)

MAIN_SOURCE_DIR="x265_v2.6"

before_configure() {
    BUILD_DIR="bld"
}

run_configure() {
    cmake -DCMAKE_INSTALL_PREFIX=/usr ../source
}

after_install() {
    $SUDO rm -vf /usr/lib/libx265.a
}
