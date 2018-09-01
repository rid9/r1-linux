#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/findutils/findutils-4.6.0.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--localstatedir=/var/lib/locate")
}

after_install() {
    $SUDO mv -v /usr/bin/find /bin &&
    $SUDO sed -i 's|find:=${BINDIR}|find:=/bin|' /usr/bin/updatedb
}
