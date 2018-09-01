#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.x.org/archive/individual/lib/libxshmfence-1.2.tar.bz2"
)

run_configure() {
    CFLAGS="${CFLAGS} -D_GNU_SOURCE" $*
}
