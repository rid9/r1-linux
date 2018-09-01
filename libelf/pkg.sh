#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://sourceware.org/ftp/elfutils/0.170/elfutils-0.170.tar.bz2"
)

cmd_install() {
    cmd_make &&
    $SUDO make -C libelf install &&
    $SUDO install -vm644 config/libelf.pc /usr/lib/pkgconfig
}
