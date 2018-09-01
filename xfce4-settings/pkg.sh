#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(exo garcon libxfce4ui gnome-icon-theme libcanberra libnotify)

SOURCE_URLS=(
    "https://archive.xfce.org/src/xfce/xfce4-settings/4.12/xfce4-settings-4.12.1.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=("--sysconfdir=/etc")
}
