#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(libwnck libxfce4ui which desktop-file-utils shared-mime-info xfdesktop)

SOURCE_URLS=(
    "https://archive.xfce.org/src/xfce/xfce4-session/4.12/xfce4-session-4.12.1.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--sysconfdir=/etc"
        "-disable-legacy-sm"
    )
}
