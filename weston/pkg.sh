#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(wayland linux-pam)

SOURCE_URLS=(
    "https://wayland.freedesktop.org/releases/weston-4.0.92.tar.xz"
)
