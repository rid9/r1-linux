#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(glib)

SOURCE_URLS=(
    "https://archive.xfce.org/src/xfce/libxfce4util/4.12/libxfce4util-4.12.1.tar.bz2"
)
