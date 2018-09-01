#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://download.savannah.gnu.org/releases/man-db/man-db-2.8.1.tar.xz"
)

DOC_DIR="/usr/share/doc/man-db-2.8.1"

before_configure() {
    CONFIGURE_FLAGS+=(
        "--docdir=${DOC_DIR}"
        "--sysconfdir=/etc"
        "--disable-setuid"
        "--enable-cache-owner=bin"
        "--with-browser=/usr/bin/lynx"
        "--with-vgrind=/usr/bin/vgrind"
        "--with-grap=/usr/bin/grap"
        "--with-systemdtmpfilesdir="
    )
}
