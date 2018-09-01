#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(exo libgudev libxfce4ui libnotify startup-notifications)

SOURCE_URLS=(
    "https://archive.xfce.org/src/xfce/thunar-volman/0.8/thunar-volman-0.8.1.tar.bz2"
)
