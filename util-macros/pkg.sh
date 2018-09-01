#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.x.org/pub/individual/util/util-macros-1.19.1.tar.bz2"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/make/}")
}

