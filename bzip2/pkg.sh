#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "http://www.bzip.org/1.0.6/bzip2-1.0.6.tar.gz"
    "http://www.linuxfromscratch.org/patches/lfs/8.2/bzip2-1.0.6-install_docs-1.patch"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
}

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    patch -Np1 -i "${SOURCES_DIR}/bzip2-1.0.6-install_docs-1.patch"
}

before_make() {
    sed -i 's@\(ln -s -f \)$(PREFIX)/bin/@\1@' Makefile &&
    sed -i "s@(PREFIX)/man@(PREFIX)/share/man@g" Makefile &&

    make -f Makefile-libbz2_so &&
    make clean
}

cmd_install() {
    cmd_make &&
    $SUDO make PREFIX=/usr install &&

    $SUDO cp -v bzip2-shared /bin/bzip2 &&
    $SUDO cp -av libbz2.so* /lib &&
    $SUDO ln -sv ../../lib/libbz2.so.1.0 /usr/lib/libbz2.so &&
    $SUDO rm -v /usr/bin/{bunzip2,bzcat,bzip2} &&
    $SUDO ln -sv bzip2 /bin/bunzip2 &&
    $SUDO ln -sv bzip2 /bin/bzcat
}
