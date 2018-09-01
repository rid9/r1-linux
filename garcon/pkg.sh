#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(libxfce4ui)

SOURCE_URLS=(
    "https://archive.xfce.org/src/xfce/garcon/0.6/garcon-0.6.1.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=("--sysconfdir=/etc")
}
