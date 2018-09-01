#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(libxcb)

SOURCE_URLS=(
    "https://xcb.freedesktop.org/dist/xcb-util-wm-0.4.1.tar.bz2"
)
