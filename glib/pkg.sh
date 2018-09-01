#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

OPT_DEPS=(pcre)

SOURCE_URLS=(
    "https://ftp.gnome.org/pub/gnome/sources/glib/2.54/glib-2.54.3.tar.xz"
    "http://www.linuxfromscratch.org/patches/blfs/8.2/glib-2.54.3-meson_fixes-1.patch"
)

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    patch -Np1 -i "${SOURCES_DIR}/glib-2.54.3-meson_fixes-1.patch"
}

before_configure() {
    BUILD_DIR="build-glib"
}

run_configure() {
    meson ${CONFIGURE_FLAGS[@]} -Dwith-pcre=system -Dwith-docs=no ..
}

run_make() {
    ninja
}

run_install() {
    $SUDO ninja install
}

after_install() {
    $SUDO chmod -v 755 /usr/bin/{gdbus-codegen,glib-gettextize}
}
