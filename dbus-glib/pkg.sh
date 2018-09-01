#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(dbus glib)

SOURCE_URLS=(
    "https://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-0.110.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--sysconfdir=/etc"
        "--disable-static"
    )
}
