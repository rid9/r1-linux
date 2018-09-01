#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://github.com/thom311/libnl/releases/download/libnl3_4_0/libnl-3.4.0.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--sysconfdir=/etc"
        "--disable-static"
    )
}
