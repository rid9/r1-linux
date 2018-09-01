#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(libevdev mtdev xorg-server)

SOURCE_URLS=(
    "https://www.x.org/pub/individual/driver/xf86-input-evdev-2.10.5.tar.bz2"
)
