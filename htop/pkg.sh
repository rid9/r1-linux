#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://hisham.hm/htop/releases/2.2.0/htop-2.2.0.tar.gz"
)
