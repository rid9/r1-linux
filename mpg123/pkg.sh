#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(alsa-lib)

SOURCE_URLS=(
    "https://downloads.sourceforge.net/mpg123/mpg123-1.25.6.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--with-audio=alsa"
        "--with-default-audio=alsa"
    )
}
