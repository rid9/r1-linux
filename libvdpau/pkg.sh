#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(libx11)

SOURCE_URLS=(
    "https://people.freedesktop.org/~aplattner/vdpau/libvdpau-1.1.1.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--docdir=/usr/share/doc/libvdpau-1.1.1"
    )
}
