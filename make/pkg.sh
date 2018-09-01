#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/make/make-4.2.1.tar.bz2"
)

before_configure() {
    sed -i '211,217 d; 219,229 d; 232 d' glob/glob.c
}
