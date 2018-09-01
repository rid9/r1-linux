#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

before_run() {
    COMMANDS=("${COMMANDS[@]/download/}")
    COMMANDS=("${COMMANDS[@]/extract/}")
    COMMANDS=("${COMMANDS[@]/configure/}")
    COMMANDS=("${COMMANDS[@]/clean_*/}")

    SOURCE_WORK_DIR="${PKG_DIR}/source"
}

cmd_clean() {
    init &&
    cd  "${SOURCE_WORK_DIR}" &&
    make clean
}
