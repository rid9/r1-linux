#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(xorg-server)

SOURCE_URLS=(
    "https://www.x.org/pub/individual/driver/xf86-video-fbdev-0.4.4.tar.bz2"
)
