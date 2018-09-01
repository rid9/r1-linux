#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/automake/automake-1.15.1.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--docdir=/usr/share/doc/automake-1.15.1"
    )
}
