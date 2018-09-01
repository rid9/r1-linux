#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "http://ftp.vim.org/pub/vim/unix/vim-8.0.586.tar.bz2"
)

before_run() {
    MAIN_SOURCE_DIR="${WORK_DIR}/vim80"
}

before_configure() {
    echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h
}

after_install() {
    $SUDO ln -sv vim /usr/bin/vi &&

    for L in  /usr/share/man/{,*/}man1/vim.1; do
        $SUDO ln -sv vim.1 $(dirname $L)/vi.1
    done &&

    $SUDO bash -c "cat ${CONFIG_DIR}/vimrc > /etc/vimrc"
}
