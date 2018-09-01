#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/gdbm/gdbm-1.14.1.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--disable-static"
        "--enable-libgdbm-compat"
    )
}
