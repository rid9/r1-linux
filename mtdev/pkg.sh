#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "http://bitmath.org/code/mtdev/mtdev-1.1.5.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=("--disable-static")
}
