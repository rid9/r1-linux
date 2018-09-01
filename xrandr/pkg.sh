#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.x.org/pub/individual/app/xrandr-1.5.0.tar.bz2"
)

after_install() {
    $SUDO rm -vf /usr/bin/xkeystone
}
