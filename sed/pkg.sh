#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/sed/sed-4.4.tar.xz"
)

DOC_DIR="/usr/share/doc/sed-4.4"

before_run() {
    COMMANDS+=(install_doc uninstall_doc)
}

before_configure() {
    CONFIGURE_FLAGS+=(
        "--bindir=/bin"
    )

    sed -i 's/usr/tools/' build-aux/help2man
}

cmd_install_doc() {
    cmd_configure &&
    make html &&

    $SUDO install -d -m755 "${DOC_DIR}" &&
    $SUDO install -m644 "doc/sed.html" "${DOC_DIR}"
}
