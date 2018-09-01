#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://github.com/fribidi/fribidi/releases/download/v1.0.1/fribidi-1.0.1.tar.bz2"
)
