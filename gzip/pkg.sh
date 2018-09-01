#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/gzip/gzip-1.9.tar.xz"
)

after_install() {
    $SUDO mv -v /usr/bin/gzip /bin
}
