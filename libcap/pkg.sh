#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.25.tar.xz"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
}

before_make() {
    sed -i '/install.*STALIBNAME/d' libcap/Makefile
}

cmd_install() {
    cmd_make &&

    $SUDO make RAISE_SETFCAP=no lib=lib prefix=/usr install &&
    $SUDO chmod -v 755 /usr/lib/libcap.so &&

    $SUDO mv -v /usr/lib/libcap.so.* /lib &&
    $SUDO ln -sfv ../../lib/$(readlink /usr/lib/libcap.so) /usr/lib/libcap.so
}
