#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "http://linux-pam.org/library/Linux-PAM-1.3.0.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--sysconfdir=/etc"
        "--libdir=/usr/lib"
        "--disable-regenerate-docu"
        "--enable-securedir=/lib/security"
        "--docdir=/usr/share/doc/Linux-PAM-1.3.0"
    )
}

after_install() {
    $SUDO chmod -v 4755 /sbin/unix_chkpwd &&

    for file in pam pam_misc pamc
    do
        $SUDO mv -v /usr/lib/lib${file}.so.* /lib &&
        $SUDO ln -sfv ../../lib/$(readlink /usr/lib/lib${file}.so) /usr/lib/lib${file}.so
    done
}
