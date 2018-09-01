#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://prdownloads.sourceforge.net/expat/expat-2.2.5.tar.bz2"
)

DOC_DIR="/usr/share/doc/expat-2.2.5"

before_run() {
    COMMANDS+=(install_doc uninstall_doc)
}

before_configure() {
    CONFIGURE_FLAGS+=("--disable-static")
}

cmd_install_doc() {
    cmd_extract &&
    cd "${SOURCE_WORK_DIR}" &&

    $SUDO install -v -dm755 "${DOC_DIR}" &&
    $SUDO install -v -m644 doc/*.{html,png,css} "${DOC_DIR}"
}
