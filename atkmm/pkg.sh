#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(atk glibmm)

SOURCE_URLS=(
    "https://ftp.gnome.org/pub/gnome/sources/atkmm/2.24/atkmm-2.24.2.tar.xz"
)

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    sed -e '/^libdocdir =/ s/$(book_name)/atkmm-2.24.2/' \
        -i doc/Makefile.in
}
