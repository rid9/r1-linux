#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz"
)

before_run() {
    COMMANDS+=(install_doc uninstall_doc)
}

before_configure() {
    CONFIGURE_FLAGS+=(
        "--disable-static"
        "--docdir=/usr/share/doc/mpc-1.1.0"
    )
}

cmd_install_doc() {
    cmd_configure &&
    make html &&
    $SUDO make install-html
}
