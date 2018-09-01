#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(util-macros)

SOURCE_URLS=(
    "https://www.x.org/archive/individual/proto/resourceproto-1.2.0.tar.bz2"
)
