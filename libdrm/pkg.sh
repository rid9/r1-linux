#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    #"https://dri.freedesktop.org/libdrm/libdrm-2.4.89.tar.bz2"
    "https://dri.freedesktop.org/libdrm/libdrm-2.4.91.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--enable-udev"
        "--enable-intel"
        "--disable-radeon"
        "--disable-amdgpu"
        "--disable-nouveau"
        "--disable-vmwgfx"
    )
}
