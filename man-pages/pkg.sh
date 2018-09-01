#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.kernel.org/pub/linux/docs/man-pages/man-pages-4.15.tar.xz"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
    COMMANDS=("${COMMANDS[@]/make/}")
}

cmd_install() {
    cmd_extract &&
    cd "${SOURCE_WORK_DIR}" &&
    $SUDO make install
}
