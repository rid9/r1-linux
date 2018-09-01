#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

OPT_DEPS=(glib freetype)

SOURCE_URLS=(
    "https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.7.5.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=("--with-gobject")
}
