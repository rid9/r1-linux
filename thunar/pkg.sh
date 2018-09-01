#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(exo libxfce4ui gnome-icon-theme libgudev libnotify xfce4-panel)

SOURCE_URLS=(
    "https://archive.xfce.org/src/xfce/thunar/1.7/Thunar-1.7.0.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--sysconfdir=/etc"
        "--docdir=/usr/share/doc/thunar-1.7.0"
    )
}
