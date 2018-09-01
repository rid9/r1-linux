#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(glib)

SOURCE_URLS=(
    "https://www.freedesktop.org/software/desktop-file-utils/releases/desktop-file-utils-0.23.tar.xz"
)
