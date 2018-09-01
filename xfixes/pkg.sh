#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(fixesproto)

SOURCE_URLS=(
    "https://www.x.org/archive/individual/lib/libXfixes-5.0.3.tar.bz2"
)
