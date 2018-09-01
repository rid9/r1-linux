#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://archive.xfce.org/src/xfce/gtk-xfce-engine/3.2/gtk-xfce-engine-3.2.0.tar.bz2"
)

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    sed -i 's/\xd6/\xc3\x96/' gtk-3.0/xfce_style_types.h
}

before_configure() {
    CONFIGURE_FLAGS+=("--enable-gtk3")
}
