#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.kernel.org/pub/software/utils/pciutils/pciutils-3.5.6.tar.xz"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
    COMMANDS=("${COMMANDS[@]/make/}")
}

run_install() {
    $SUDO make PREFIX=/usr \
         SHAREDIR=/usr/share/hwdata \
         SHARED=yes \
         install install-lib &&

    $SUDO chmod -v 755 /usr/lib/libpci.so
}
