#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz"
)

DOC_DIR="/usr/share/doc/flex-2.6.4"

before_run() {
    COMMANDS+=(install_doc uninstall_doc)
}

before_configure() {
    CONFIGURE_FLAGS+=(
        "--docdir=${DOC_DIR}"
    )

    sed -i "/math.h/a #include <malloc.h>" src/flexdef.h
}

run_configure() {
    HELP2MAN="/tools/bin/true" $*
}

after_install() {
    $SUDO ln -sv flex /usr/bin/lex &&

    $SUDO rm -rf "${DOC_DIR}"
}

cmd_install_doc() {
    cmd_make &&
    $SUDO make install
}

