#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(xcb-util)

SOURCE_URLS=(
    "https://xcb.freedesktop.org/dist/xcb-util-cursor-0.1.3.tar.bz2"
)
