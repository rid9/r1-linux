#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(gtk+-3 gobject-introspection notification-daemon)

SOURCE_URLS=(
    "https://ftp.gnome.org/pub/gnome/sources/libnotify/0.7/libnotify-0.7.7.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--disable-static")
}
