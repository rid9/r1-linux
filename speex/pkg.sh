#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(libogg)

SOURCE_URLS=(
    "https://downloads.xiph.org/releases/speex/speex-1.2.0.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--disable-static"
        "--docdir=/usr/share/doc/speex-1.2.0"
    )
}
