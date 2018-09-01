#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(at-spi2-atk gdk-pixbuf libepoxy pango six wayland wayland-protocols libxkbcommon adwaita-icon-theme gobject-introspection)

SOURCE_URLS=(
    "https://ftp.gnome.org/pub/gnome/sources/gtk+/3.22/gtk+-3.22.28.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--sysconfdir=/etc"
        "--enable-broadway-backend"
        "--enable-x11-backend"
        "--enable-wayland-backend"
    )
}
