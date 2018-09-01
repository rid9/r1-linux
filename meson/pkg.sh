#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://github.com/mesonbuild/meson/releases/download/0.44.0/meson-0.44.0.tar.gz"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
}

cmd_make() {
    cmd_extract &&
    cd "${SOURCE_WORK_DIR}" &&
    python3 setup.py build
}

cmd_install() {
    cmd_make &&
    $SUDO python3 setup.py install
}
