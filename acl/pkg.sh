#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://download.savannah.gnu.org/releases/acl/acl-2.2.52.src.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--bindir=/bin"
        "--disable-static"
        "--libexecdir=/usr/lib"
    )

    sed -i -e 's|/@pkg_name@|&-@pkg_version@|' include/builddefs.in &&

    sed -i -e "/TABS-1;/a if (x > (TABS-1)) x = (TABS-1);" \
        libacl/__acl_to_any_text.c
}

cmd_install() {
    cmd_make &&

    $SUDO make install install-dev install-lib &&
    $SUDO chmod -v 755 /usr/lib/libacl.so &&

    $SUDO mv -v /usr/lib/libacl.so.* /lib &&
    $SUDO ln -sfv ../../lib/$(readlink /usr/lib/libacl.so) /usr/lib/libacl.so
}
