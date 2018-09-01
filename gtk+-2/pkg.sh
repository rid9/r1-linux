#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(atk gdk-pixbuf pango hicolor-icon-theme)

SOURCE_URLS=(
    "https://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-2.24.32.tar.xz"
)

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    sed -e 's#l \(gtk-.*\).sgml#& -o \1#' \
        -i docs/{faq,tutorial}/Makefile.in
}

before_configure() {
    CONFIGURE_FLAGS+=("--sysconfdir=/etc")
}
