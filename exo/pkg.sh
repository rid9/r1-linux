#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(libxfce4ui libxfce4util cpan-uri)

SOURCE_URLS=(
    "https://archive.xfce.org/src/xfce/exo/0.12/exo-0.12.0.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=("--sysconfdir=/etc")
}
