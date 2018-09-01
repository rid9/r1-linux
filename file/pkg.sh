#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "http://ftp.lfs-matrix.net/pub/lfs/lfs-packages/8.2/file-5.32.tar.gz"
)
