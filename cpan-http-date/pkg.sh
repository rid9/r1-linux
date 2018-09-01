#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://cpan.metacpan.org/authors/id/G/GA/GAAS/HTTP-Date-6.02.tar.gz"
)

cmd_configure() {
    cmd_extract &&
    cd "${SOURCE_WORK_DIR}" &&

    perl Makefile.PL
}
