#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://downloads.sourceforge.net/faac/faad2-2.8.8.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--disable-static")
}
