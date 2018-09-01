#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://github.com/webmproject/libvpx/archive/v1.7.0/libvpx-1.7.0.tar.gz"
)

before_configure() {
    BUILD_DIR="libvpx-build"

    CONFIGURE_FLAGS+=(
        "--enable-shared"
        "--disable-static"
    )
}
