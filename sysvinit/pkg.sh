#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://download.savannah.gnu.org/releases/sysvinit/sysvinit-2.88dsf.tar.bz2"
    "http://www.linuxfromscratch.org/patches/lfs/8.2/sysvinit-2.88dsf-consolidated-1.patch"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
}

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    patch -Np1 -i "${SOURCES_DIR}/sysvinit-2.88dsf-consolidated-1.patch"
}

run_make() {
    make -C src
}

run_install() {
    $SUDO make -C src install
}
