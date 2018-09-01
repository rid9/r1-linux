#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(mesa)

SOURCE_URLS=(
    "https://github.com/anholt/libepoxy/releases/download/1.4.3/libepoxy-1.4.3.tar.xz"
)
