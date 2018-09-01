#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(libxcb)

SOURCE_URLS=(
    "https://xcb.freedesktop.org/dist/xcb-util-renderutil-0.3.9.tar.bz2"
)
