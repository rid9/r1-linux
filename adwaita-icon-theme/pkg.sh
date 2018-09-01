#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnome.org/pub/gnome/sources/adwaita-icon-theme/3.26/adwaita-icon-theme-3.26.1.tar.xz"
)
