#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(libpng pixman)

SOURCE_URLS=(
    "https://www.cairographics.org/releases/cairo-1.14.12.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--disable-static")
}
