#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://downloads.sourceforge.net/libpng/libpng-1.6.34.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--disable-static")
}

run_configure() {
    LIBS=-lpthread $*
}
