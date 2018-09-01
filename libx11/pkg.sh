#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(xproto xextproto xtrans libxcb kbproto inputproto)

SOURCE_URLS=(
    "https://www.x.org/archive/individual/lib/libX11-1.6.5.tar.bz2"
)
