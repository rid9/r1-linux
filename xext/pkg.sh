#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(xextproto)

SOURCE_URLS=(
    "https://www.x.org/archive/individual/lib/libXext-1.3.3.tar.bz2"
)
