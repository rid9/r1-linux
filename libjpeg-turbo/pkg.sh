#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(yasm)

SOURCE_URLS=(
    "https://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-1.5.3.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--mandir=/usr/share/man"
        "--with-jpeg8"
        "--disable-static"
        "--docdir=/usr/share/doc/libjpeg-turbo-1.5.3"
    )
}
