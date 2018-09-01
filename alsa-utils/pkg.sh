#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(alsa-lib)

SOURCE_URLS=(
    "ftp://ftp.alsa-project.org/pub/utils/alsa-utils-1.1.5.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--disable-alsaconf"
        "--disable-bat"
        "--disable-xmlto"
        "--with-curses=ncursesw"
    )
}
