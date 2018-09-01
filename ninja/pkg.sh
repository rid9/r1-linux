#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://github.com/ninja-build/ninja/archive/v1.8.2/ninja-1.8.2.tar.gz"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
}

cmd_make() {
    cmd_extract &&
    cd "${SOURCE_WORK_DIR}" &&
    python3 configure.py --bootstrap
}

cmd_install() {
    cmd_make &&
    $SUDO install -vm755 ninja /usr/bin/
}
