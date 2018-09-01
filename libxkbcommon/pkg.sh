#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(xkeyboard-config libxcb)

SOURCE_URLS=(
    "https://xkbcommon.org/download/libxkbcommon-0.8.0.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--docdir=/usr/share/doc/libxkbcommon-0.8.0"
    )
}
