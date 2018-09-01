#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(gtk+-3 libcanberra)

SOURCE_URLS=(
    "https://ftp.gnome.org/pub/gnome/sources/notification-daemon/3.20/notification-daemon-3.20.0.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--sysconfdir=/etc"
        "--disable-static"
    )
}
