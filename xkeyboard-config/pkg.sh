#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.x.org/pub/individual/data/xkeyboard-config/xkeyboard-config-2.23.1.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=("--with-xkb-rules-symlink=xorg")
}
