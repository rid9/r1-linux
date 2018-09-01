#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.kernel.org/pub/linux/utils/net/iproute2/iproute2-4.15.0.tar.xz"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
}

before_make() {
    sed -i /ARPD/d Makefile &&
    rm -fv man/man8/arpd.8 &&

    sed -i 's/m_ipt.o//' tc/Makefile
}

run_install() {
    $SUDO make DOCDIR="/usr/share/doc/iproute2-4.15.0" install
}
