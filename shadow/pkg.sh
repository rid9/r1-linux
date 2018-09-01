#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://github.com/shadow-maint/shadow/releases/download/4.5/shadow-4.5.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS=(
        "--sysconfdir=/etc"
        "--with-group-name-max-length=32"
    )

    sed -i 's/groups$(EXEEXT) //' src/Makefile.in &&
    find man -name Makefile.in -exec sed -i 's/groups\.1 / /' {} \; &&
    find man -name Makefile.in -exec sed -i 's/getspnam\.3 / /' {} \; &&
    find man -name Makefile.in -exec sed -i 's/passwd\.5 / /' {} \; &&

    sed -i -e 's@#ENCRYPT_METHOD DES@ENCRYPT_METHOD SHA512@' \
           -e 's@/var/spool/mail@/var/mail@' etc/login.defs &&

    sed -i 's/1000/999/' etc/useradd
}

after_install() {
    $SUDO mv -v /usr/bin/passwd /bin &&

    $SUDO sed -i 's/yes/no/' /etc/default/useradd &&

    $SUDO pwconv
}
