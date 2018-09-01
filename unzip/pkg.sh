#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://downloads.sourceforge.net/infozip/unzip60.tar.gz"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
}

run_make() {
    make -f unix/Makefile generic
}

run_install() {
    $SUDO make prefix=/usr MANDIR=/usr/share/man/man1 \
        -f unix/Makefile install
}

