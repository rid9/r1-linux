#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/texinfo/texinfo-6.5.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--disable-static")
}
