#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(libogg)

SOURCE_URLS=(
    "https://downloads.xiph.org/releases/speex/speexdsp-1.2rc3.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--disable-static"
        "--docdir=/usr/share/doc/speexdsp-1.2rc3"
    )
}
