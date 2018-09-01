#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(nasm)
OPT_DEPS=(libogg)

SOURCE_URLS=(
    "https://downloads.xiph.org/releases/flac/flac-1.3.2.tar.xz"
)
