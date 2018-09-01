#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.libsdl.org/release/SDL2-2.0.7.tar.gz"
)

after_install() {
    $SUDO rm -v /usr/lib/libSDL2*.a
}
