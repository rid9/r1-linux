#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.cairographics.org/releases/pixman-0.34.0.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--disable-static")
}
