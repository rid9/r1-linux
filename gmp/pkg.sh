#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/gmp/gmp-6.1.2.tar.xz"
)

before_run() {
    COMMANDS+=(install_doc uninstall_doc)
}

before_configure() {
    CONFIGURE_FLAGS+=(
        "--enable-cxx"
        "--disable-static"
        "--docdir=/usr/share/doc/gmp-6.1.2"
    )
}

cmd_install_doc() {
    cmd_configure &&
    make html &&
    $SUDO make install-html
}
