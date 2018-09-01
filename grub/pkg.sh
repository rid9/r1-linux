#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/grub/grub-2.02.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--sbindir=/sbin"
        "--sysconfdir=/etc"
        "--disable-efiemu"
        "--disable-werror"
    )
}
