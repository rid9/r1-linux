#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(cairomm glibmm pango)

SOURCE_URLS=(
    "https://ftp.gnome.org/pub/gnome/sources/pangomm/2.40/pangomm-2.40.1.tar.xz"
)

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    sed -e '/^libdocdir =/ s/$(book_name)/pangomm-2.40.1/' \
        -i docs/Makefile.in
}
