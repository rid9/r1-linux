#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(xfconf gtk+-2 gtk+-3 startup-notifications)

SOURCE_URLS=(
    "https://archive.xfce.org/src/xfce/libxfce4ui/4.12/libxfce4ui-4.12.1.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=("--sysconfdir=/etc")
}
