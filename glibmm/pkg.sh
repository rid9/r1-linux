#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(glib libsigc++)

SOURCE_URLS=(
    "https://ftp.gnome.org/pub/gnome/sources/glibmm/2.54/glibmm-2.54.1.tar.xz"
)

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    sed -e '/^libdocdir =/ s/$(book_name)/glibmm-2.54.1/' \
        -i docs/Makefile.in
}
