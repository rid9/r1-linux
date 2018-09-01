#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(libxcb)

SOURCE_URLS=(
    "https://xcb.freedesktop.org/dist/xcb-util-keysyms-0.4.0.tar.bz2"
)
