#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(exo libwnck libxfce4ui libnotify startup-notifications)

SOURCE_URLS=(
    "https://archive.xfce.org/src/xfce/xfdesktop/4.12/xfdesktop-4.12.4.tar.bz2"
)
