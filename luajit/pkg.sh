#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "http://luajit.org/download/LuaJIT-2.0.5.tar.gz"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
}

run_install() {
    $SUDO make PREFIX=/usr install
}
