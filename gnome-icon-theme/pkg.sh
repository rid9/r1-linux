#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(gtk+-3 hicolor-icon-theme icon-naming-utils)

SOURCE_URLS=(
    "https://ftp.gnome.org/pub/gnome/sources/gnome-icon-theme/3.12/gnome-icon-theme-3.12.0.tar.xz"
)
