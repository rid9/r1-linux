#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(wayland)

SOURCE_URLS=(
    "https://wayland.freedesktop.org/releases/wayland-protocols-1.14.tar.xz"
)
