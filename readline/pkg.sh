#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/readline/readline-7.0.tar.gz"
)

DOC_DIR="/usr/share/doc/readline-7.0"

before_run() {
    COMMANDS+=(install_doc uninstall_doc)
}

before_configure() {
    CONFIGURE_FLAGS+=(
        "--disable-static"
        "--docdir=${DOC_DIR}"
    )

    sed -i '/MV.*old/d' Makefile.in &&
    sed -i '/{OLDSUFF}/c:' support/shlib-install
}

run_make() {
    SHLIB_LIBS="-L/tools/lib -lncursesw" $*
}

after_install() {
    $SUDO mv -v /usr/lib/lib{readline,history}.so.* /lib &&
    $SUDO ln -sfv ../../lib/$(readlink /usr/lib/libreadline.so) /usr/lib/libreadline.so &&
    $SUDO ln -sfv ../../lib/$(readlink /usr/lib/libhistory.so) /usr/lib/libhistory.so
}

cmd_install_doc() {
    cmd_make &&

    if ! [ -d "${DOC_DIR}" ]; then
        $SUDO mkdir -v -m644 "${DOC_DIR}"
    fi &&

    $SUDO install -v -m644 doc/*.{ps,pdf,html,dvi} "${DOC_DIR}"
}
