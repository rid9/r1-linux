#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(garcon libxfce4ui)

SOURCE_URLS=(
    "https://archive.xfce.org/src/xfce/xfce4-appfinder/4.12/xfce4-appfinder-4.12.0.tar.bz2"
)
