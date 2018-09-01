#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/gettext/gettext-0.19.8.1.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--disable-static"
        "--docdir=/usr/share/doc/gettext-0.19.8.1"
    )
}

after_install() {
    $SUDO chmod -v 0755 /usr/lib/preloadable_libintl.so
}
