#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://sourceware.org/ftp/lvm2/releases/LVM2.2.02.177.tgz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--exec-prefix="
        "--enable-applib"
        "--enable-cmdlib"
        "--enable-pkgconfig"
        "--enable-udev_sync"
    )
}
