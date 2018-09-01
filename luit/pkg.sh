#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.x.org/pub/individual/app/luit-1.1.1.tar.bz2"
)

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    sed -i -e "/D_XOPEN/s/5/6/" ./configure
}
