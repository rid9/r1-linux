#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/gawk/gawk-4.2.0.tar.xz"
)

before_configure() {
    sed -i 's/extras//' Makefile.in
}
