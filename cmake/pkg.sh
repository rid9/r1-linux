#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(libuv curl libarchive)

SOURCE_URLS=(
    "https://cmake.org/files/v3.10/cmake-3.10.2.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--system-libs"
        "--mandir=/share/man"
        "--no-system-jsoncpp"
        "--no-system-librhash"
        "--docdir=/share/doc/cmake-3.10.2"
    )

    sed -i '/"lib64"/s/64//' Modules/GNUInstallDirs.cmake
}
