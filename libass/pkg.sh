#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(freetype fribidi nasm fontconfig)

SOURCE_URLS=(
    "https://github.com/libass/libass/releases/download/0.14.0/libass-0.14.0.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--disable-static")
}
