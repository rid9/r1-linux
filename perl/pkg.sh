#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.cpan.org/src/5.0/perl-5.26.1.tar.xz"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
}

cmd_make() {
    export BUILD_ZLIB=False
    export BUILD_BZIP2=0

    cmd_extract &&
    cd "${SOURCE_WORK_DIR}" &&

    sh Configure -des -Dprefix=/usr \
                      -Dvendorprefix=/usr \
                      -Dman1dir=/usr/share/man/man1 \
                      -Dman3dir=/usr/share/man/man3 \
                      -Dpager="/usr/bin/less -isR" \
                      -Duseshrplib \
                      -Dusethreads &&

    make

    unset BUILD_ZLIB
    unset BUILD_BZIP2
}

cmd_install() {
    cmd_make &&
    $SUDO make install
}
