#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.x.org/archive/individual/lib/libXfont2-2.0.3.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=("--disable-devel-docs")
}
