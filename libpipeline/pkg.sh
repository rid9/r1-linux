#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://download.savannah.gnu.org/releases/libpipeline/libpipeline-1.5.0.tar.gz"
)
