#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(libwnck libxfce4ui libxfce4util startup-notifications)

SOURCE_URLS=(
    "https://archive.xfce.org/src/xfce/xfwm4/4.12/xfwm4-4.12.4.tar.bz2"
)
