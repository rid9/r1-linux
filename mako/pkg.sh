#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(beaker markupsafe)

SOURCE_URLS=(
    "https://files.pythonhosted.org/packages/source/M/Mako/Mako-1.0.4.tar.gz"
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

