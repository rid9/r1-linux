#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/faenza-icon-theme/faenza-icon-theme_1.3.zip"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
    COMMANDS=("${COMMANDS[@]/make/}")
}

cmd_install() {
    cmd_extract &&
    cd "${SOURCE_WORK_DIR}" &&
    $SUDO ./INSTALL
}
