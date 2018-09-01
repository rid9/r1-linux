#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(glib libjpeg-turbo libpng shared-mime-info libtiff)

SOURCE_URLS=(
    "http://ftp.gnome.org/pub/gnome/sources/gdk-pixbuf/2.36/gdk-pixbuf-2.36.11.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--with-x11")
}
