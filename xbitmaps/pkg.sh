#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(util-macros)

SOURCE_URLS=(
    "https://www.x.org/pub/individual/data/xbitmaps-1.1.1.tar.bz2"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/make/}")
}
