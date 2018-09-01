#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://icon-theme.freedesktop.org/releases/hicolor-icon-theme-0.17.tar.xz"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/make/}")
}
