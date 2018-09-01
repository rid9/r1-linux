#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(libpciaccess wayland)
OPT_DEPS=(mesa)

SOURCE_URLS=(
    "https://github.com/intel/libva/releases/download/2.1.0/libva-2.1.0.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=("--enable-wayland")
}
