#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://github.com/libuv/libuv/archive/v1.19.1/libuv-1.19.1.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--disable-static")
    sh autogen.sh
}
