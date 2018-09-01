#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.mpfr.org/mpfr-4.0.1/mpfr-4.0.1.tar.xz"
)

before_run() {
    COMMANDS+=(install_doc uninstall_doc)
}

before_configure() {
    CONFIGURE_FLAGS+=(
        "--disable-static"
        "--enable-thread-safe"
        "--docdir=/usr/share/doc/mpfr-4.0.1"
    )
}

after_install() {
    $SUDO rm -rf "/usr/share/doc/mpfr-4.0.1"
}

cmd_install_doc() {
    cmd_make &&
    make html &&
    $SUDO make install &&
    $SUDO make install-html
}
