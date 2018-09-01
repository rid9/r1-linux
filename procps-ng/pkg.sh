#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://sourceforge.net/projects/procps-ng/files/Production/procps-ng-3.3.12.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--exec-prefix="
        "--libdir=/usr/lib"
        "--docdir=/usr/share/doc/procps-ng-3.3.12"
        "--disable-static"
        "--disable-kill"
    )
}

after_install() {
    $SUDO mv -v /usr/lib/libprocps.so.* /lib &&
    $SUDO ln -sfv ../../lib/$(readlink /usr/lib/libprocps.so) /usr/lib/libprocps.so
}
