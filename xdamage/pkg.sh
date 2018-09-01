#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(damageproto xfixes fixesproto)

SOURCE_URLS=(
    "https://www.x.org/archive/individual/lib/libXdamage-1.1.4.tar.bz2"
)
