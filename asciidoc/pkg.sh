#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://downloads.sourceforge.net/asciidoc/asciidoc-8.6.9.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--sysconfdir=/etc"
        "--docdir=/usr/share/doc/asciidoc-8.6.9"
    )
}
