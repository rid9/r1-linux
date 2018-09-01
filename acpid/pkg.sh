#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://downloads.sourceforge.net/acpid2/acpid-2.0.28.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--docdir=/usr/share/doc/acpid-2.0.28")
}

after_install() {
    $SUDO install -v -m755 -d /etc/acpi/events
}
