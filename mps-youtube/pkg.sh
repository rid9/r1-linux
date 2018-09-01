#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(python3)

SOURCE_URLS=(
    "https://github.com/mps-youtube/mps-youtube/archive/v0.2.8.tar.gz"
)

MAIN_SOURCE_DIR="mps-youtube-0.2.8"

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
}

run_make() {
    python3 setup.py build
}

run_install() {
    $SUDO python3 setup.py install --optimize=1
}
