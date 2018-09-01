#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/tar/tar-1.30.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--bindir=/bin")
}

run_configure() {
    FORCE_UNSAFE_CONFIGURE=1 $*
}
