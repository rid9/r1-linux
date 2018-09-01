#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(exo garcon libwnck libxfce4ui)

SOURCE_URLS=(
    "https://archive.xfce.org/src/xfce/xfce4-panel/4.12/xfce4-panel-4.12.2.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--sysconfdir=/etc"
        "--enable-gtk3"
    )
}
