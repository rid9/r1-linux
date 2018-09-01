#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://github.com/horst3180/vertex-theme/archive/20170128.tar.gz"
)

MAIN_SOURCE_DIR="vertex-theme-20170128"

before_configure() {
    CONFIGURE="./autogen.sh"
}
