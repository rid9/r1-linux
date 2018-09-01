#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.cpan.org/authors/id/G/GA/GAAS/Data-Dump-1.23.tar.gz"
)

cmd_configure() {
    cmd_extract &&
    cd "${SOURCE_WORK_DIR}" &&

    perl Makefile.PL
}
