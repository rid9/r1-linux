#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/groff/groff-1.22.3.tar.gz"
)

run_configure() {
    PAGE=A4 $*
}

run_make() {
    $* -j1
}
