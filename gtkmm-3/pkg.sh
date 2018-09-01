#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(atkmm gtk+-3 pangomm)

SOURCE_URLS=(
    "https://ftp.gnome.org/pub/gnome/sources/gtkmm/3.22/gtkmm-3.22.2.tar.xz"
)

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    sed -e '/^libdocdir =/ s/$(book_name)/gtkmm-3.22.2/' \
        -i docs/Makefile.in
}
