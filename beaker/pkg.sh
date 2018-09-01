#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(python2 python3)

SOURCE_URLS=(
    "https://files.pythonhosted.org/packages/source/B/Beaker/Beaker-1.9.0.tar.gz"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
    COMMANDS=("${COMMANDS[@]/make/}")
}

cmd_install() {
    cmd_extract &&
    cd "${SOURCE_WORK_DIR}" &&

    $SUDO python setup.py install --optimize=1 &&
    $SUDO python3 setup.py install --optimize=1
}
