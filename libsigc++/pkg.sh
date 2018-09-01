#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnome.org/pub/gnome/sources/libsigc++/2.10/libsigc++-2.10.0.tar.xz"
)

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    sed -e '/^libdocdir =/ s/$(book_name)/libsigc++-2.10.0/' \
        -i docs/Makefile.in
}
