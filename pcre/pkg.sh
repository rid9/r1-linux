#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://downloads.sourceforge.net/pcre/pcre-8.41.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--docdir=/usr/share/doc/pcre-8.41"
        "--enable-unicode-properties"
        "--enable-pcre16"
        "--enable-pcre32"
        "--enable-pcregrep-libz"
        "--enable-pcregrep-libbz2"
        "--enable-pcretest-libreadline"
        "--disable-static"
        "--enable-jit"
    )
}

after_install() {
    $SUDO mv -v /usr/lib/libpcre.so.* /lib &&
    $SUDO ln -sfv ../../lib/$(readlink /usr/lib/libpcre.so) /usr/lib/libpcre.so
}
