#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(glib libxml2)

SOURCE_URLS=(
    "https://people.freedesktop.org/~hadess/shared-mime-info-1.9.tar.xz"
)
