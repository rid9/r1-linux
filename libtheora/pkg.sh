#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(libogg libvorbis)

SOURCE_URLS=(
    "https://downloads.xiph.org/releases/theora/libtheora-1.1.1.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--disable-static")
}
