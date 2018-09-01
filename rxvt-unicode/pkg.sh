#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "http://dist.schmorp.de/rxvt-unicode/Attic/rxvt-unicode-9.22.tar.bz2"
)
