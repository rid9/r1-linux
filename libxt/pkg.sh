#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.x.org/archive/individual/lib/libXt-1.1.5.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=("--with-appdefaultdir=/etc/X11/app-defaults")
}
