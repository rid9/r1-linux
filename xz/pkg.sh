#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://tukaani.org/xz/xz-5.2.3.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--disable-static"
        "--docdir=/usr/share/doc/xz-5.2.3"
    )
}

after_install() {
    $SUDO mv -v /usr/bin/{lzma,unlzma,lzcat,xz,unxz,xzcat} /bin &&
    $SUDO mv -v /usr/lib/liblzma.so.* /lib &&
    $SUDO ln -svf ../../lib/$(readlink /usr/lib/liblzma.so) /usr/lib/liblzma.so
}
