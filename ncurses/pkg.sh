#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu//ncurses/ncurses-6.1.tar.gz"
)

before_run() {
    COMMANDS+=(install_doc uninstall_doc)
}

before_configure() {
    CONFIGURE_FLAGS+=(
        "--mandir=/usr/share/man"
        "--with-shared"
        "--without-debug"
        "--without-normal"
        "--enable-pc-files"
        "--enable-widec"
    )
}

after_install() {
    $SUDO mv -v /usr/lib/libncursesw.so.6* /lib &&

    $SUDO ln -sfv ../../lib/$(readlink /usr/lib/libncursesw.so) /usr/lib/libncursesw.so &&

    for lib in ncurses form panel menu; do
        $SUDO rm -vf /usr/lib/lib${lib}.so &&
        $SUDO bash -c "echo 'INPUT(-l${lib}w)' > /usr/lib/lib${lib}.so" &&
        $SUDO ln -sfv ${lib}w.pc /usr/lib/pkgconfig/${lib}.pc
    done &&

    $SUDO rm -vf /usr/lib/libcursesw.so &&
    $SUDO bash -c "echo 'INPUT(-lncursesw)' > /usr/lib/libcursesw.so" &&
    $SUDO ln -sfv libncurses.so /usr/lib/libcurses.so
}

cmd_install_doc() {
    DOC_DIR="/usr/share/doc/ncurses-6.1"

    cmd_extract &&
    cd "${SOURCE_WORK_DIR}" &&

    if ! [ -d "${DOC_DIR}" ]; then
        $SUDO mkdir -v "${DOC_DIR}"
    fi &&

    $SUDO cp -v -R doc/* "${DOC_DIR}"
}
