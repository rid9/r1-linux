#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "http://www.linuxfromscratch.org/lfs/downloads/8.2/lfs-bootscripts-20170626.tar.bz2"
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
