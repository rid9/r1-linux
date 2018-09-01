#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "http://quantum-mirror.hu/mirrors/pub/gnusavannah/libunwind/libunwind-1.2.tar.gz"
)
