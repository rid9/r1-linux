#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(python2)

SOURCE_URLS=(
    "https://downloads.sourceforge.net/docutils/docutils-0.14.tar.gz"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
}

run_make() {
    python setup.py build
}

run_install() {
    $SUDO  python setup.py install --optimize=1 &&

    for f in /usr/bin/rst*.py; do
        $SUDO ln -svf $(basename $f) /usr/bin/$(basename $f .py)
    done
}
