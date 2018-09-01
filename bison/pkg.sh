#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/bison/bison-3.0.4.tar.xz"
)

DOC_DIR="/usr/share/doc/bison-3.0.4"

before_run() {
    COMMANDS+=(install_doc uninstall_doc)
}

before_configure() {
    CONFIGURE_FLAGS+=("--docdir=${DOC_DIR}")
}

after_install() {
    rm -rf "${DOC_DIR}"
}

cmd_install_doc() {
    cmd_make &&
    $SUDO make install
}
