#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(glib)

SOURCE_URLS=(
    "https://ftp.gnome.org/pub/gnome/sources/libgudev/232/libgudev-232.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--disable-umockdev")
}
