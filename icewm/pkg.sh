#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(gdk-pixbuf)

SOURCE_URLS=(
    "https://github.com/bbidulock/icewm/releases/download/1.4.2/icewm-1.4.2.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--sysconfdir=/etc"
        "--docdir=/usr/share/doc/icewm-1.4.2"
    )
}

after_install() {
    $SUDO rm /usr/share/xsessions/icewm.desktop
}
