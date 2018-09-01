#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnome.org/pub/gnome/sources/at-spi2-core/2.24/at-spi2-core-2.24.1.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--sysconfdir=/etc")
}
