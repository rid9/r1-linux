#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(libogg)

SOURCE_URLS=(
    "https://downloads.xiph.org/releases/vorbis/libvorbis-1.3.5.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--disable-static")
}
