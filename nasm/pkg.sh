#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.nasm.us/pub/nasm/releasebuilds/2.13.03/nasm-2.13.03.tar.xz"
)
