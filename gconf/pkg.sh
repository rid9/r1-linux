#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(dbus-glib libxml2 gobject-introspection gtk+-3)

SOURCE_URLS=(
    "https://ftp.gnome.org/pub/gnome/sources/GConf/3.2/GConf-3.2.6.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--sysconfdir=/etc"
        "--disable-orbit"
        "--disable-static"
    )
}

after_install() {
    $SUDO ln -s gconf.xml.defaults /etc/gconf/gconf.xml.system
}
