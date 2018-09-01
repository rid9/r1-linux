#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "http://links.twibright.com/download/links-2.14.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--mandir=/usr/share/man"
        "--without-gpm"
    )
}
