#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://download.savannah.nongnu.org/releases/fbi-improved/fim-0.6-trunk.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--disable-exif")
}

run_configure() {
    CFLAGS="${CFLAGS} -lpthread" \
    CXXFLAGS="${CFLAGS}" \
    $*
}
