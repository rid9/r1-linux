#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://download.savannah.gnu.org/releases/attr/attr-2.4.47.src.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--bindir=/bin"
        "--disable-static"
    )

    sed -i -e 's|/@pkg_name@|&-@pkg_version@|' include/builddefs.in &&
    sed -i -e "/SUBDIRS/s|man[25]||g" man/Makefile
}

cmd_install() {
    cmd_make &&

    $SUDO make install install-dev install-lib &&
    $SUDO chmod -v 755 /usr/lib/libattr.so &&

    $SUDO mv -v /usr/lib/libattr.so.* /lib &&
    $SUDO ln -sfv ../../lib/$(readlink /usr/lib/libattr.so) /usr/lib/libattr.so
}
