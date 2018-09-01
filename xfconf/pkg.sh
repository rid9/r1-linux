#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(dbus-glib libxfce4util)

SOURCE_URLS=(
    "https://archive.xfce.org/src/xfce/xfconf/4.12/xfconf-4.12.1.tar.bz2"
)
