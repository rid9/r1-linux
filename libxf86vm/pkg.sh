#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.x.org/archive/individual/lib/libXxf86vm-1.1.4.tar.bz2"
)
