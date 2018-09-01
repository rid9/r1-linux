#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(cairo libsigc++)
OPT_DEPS=(boost)

SOURCE_URLS=(
    "https://www.cairographics.org/releases/cairomm-1.12.2.tar.gz"
)

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    sed -e '/^libdocdir =/ s/$(book_name)/cairomm-1.12.2/' \
        -i docs/Makefile.in
}
