#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

OPT_DEPS=(alsa-lib flac libogg libvorbis sqlite)

SOURCE_URLS=(
    "http://www.mega-nerd.com/libsndfile/files/libsndfile-1.0.28.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--disable-static"
        "--docdir=/usr/share/doc/libsndfile-1.0.28"
    )
}
