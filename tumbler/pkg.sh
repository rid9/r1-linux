#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(glib)

SOURCE_URLS=(
    "https://archive.xfce.org/src/xfce/tumbler/0.2/tumbler-0.2.0.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=("--sysconfdir=/etc")
}
