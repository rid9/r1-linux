#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(gtk+-2 startup-notifications)

SOURCE_URLS=(
    "https://ftp.gnome.org/pub/gnome/sources/libwnck/2.30/libwnck-2.30.7.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--disable-static"
        "--program-suffix=-1"
    )
}

run_make() {
    make GETTEXT_PACKAGE=libwnck-1
}

run_install() {
    $SUDO make GETTEXT_PACKAGE=libwnck-1 install
}
