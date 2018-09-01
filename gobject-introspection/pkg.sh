#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(glib)
OPT_DEPS=(which)

SOURCE_URLS=(
    "http://ftp.gnome.org/pub/gnome/sources/gobject-introspection/1.54/gobject-introspection-1.54.1.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--disable-static"
        "--with-python=/usr/bin/python3"
    )
}
