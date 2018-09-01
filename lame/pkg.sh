#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(nasm)

SOURCE_URLS=(
    "https://downloads.sourceforge.net/lame/lame-3.100.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--disable-static"
        "--enable-mp3rtp"
        "--enable-nasm"
    )

     case $(uname -m) in
         i?86) sed -i -e 's/<xmmintrin.h/&.nouse/' configure ;;
     esac
}

run_install() {
    $SUDO make pkghtmldir=/usr/share/doc/lame-3.100 install
}
