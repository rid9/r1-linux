#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://pkg-config.freedesktop.org/releases/pkg-config-0.29.2.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--with-internal-glib"
        "--disable-host-tool"
        "--docdir=/usr/share/doc/pkg-config-0.29.2"
    )
}
