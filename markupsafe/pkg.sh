#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(python2 python3)

SOURCE_URLS=(
    "https://files.pythonhosted.org/packages/source/M/MarkupSafe/MarkupSafe-1.0.tar.gz"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
}

run_make() {
    python setup.py build &&
    python3 setup.py build
}

run_install() {
    $SUDO python setup.py install --optimize=1 &&
    $SUDO python3 setup.py install --optimize=1
}
