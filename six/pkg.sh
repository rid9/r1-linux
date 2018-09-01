#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://pypi.io/packages/source/s/six/six-1.11.0.tar.gz"
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
