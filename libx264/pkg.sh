#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(nasm)

SOURCE_URLS=(
    "https://download.videolan.org/x264/snapshots/x264-snapshot-20180212-2245-stable.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--enable-lto"
        "--enable-shared"
        "--disable-cli"
    )
}
