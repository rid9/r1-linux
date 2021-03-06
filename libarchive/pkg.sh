#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.libarchive.org/downloads/libarchive-3.3.2.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--disable-static")
}
