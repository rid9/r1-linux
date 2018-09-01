#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(dbus)

cmd_download() {
    init &&

    make_sources_dir &&
    cd "${SOURCES_DIR}" &&

    if ! [ -d "ell" ]; then
        git clone git://git.kernel.org/pub/scm/libs/ell/ell.git
    fi &&

    if ! [ -d "iwd" ]; then
        git clone git://git.kernel.org/pub/scm/network/wireless/iwd.git
    fi
}

cmd_configure() {
    cmd_download &&

    cd iwd &&
    ./bootstrap &&
    ./configure \
        ${CONFIGURE_FLAGS[@]} \
        --localstatedir=/var \
        --sysconfdir=/etc \
        --disable-systemd-service
}

cmd_make() {
    cmd_configure &&
    make
}

cmd_install() {
    cmd_make &&
    $SUDO make install
}
