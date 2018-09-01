#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://cpan.metacpan.org/authors/id/E/ET/ETHER/libwww-perl-6.35.tar.gz"
)

cmd_configure() {
    cmd_extract &&
    cd "${SOURCE_WORK_DIR}" &&

    perl Makefile.PL
}
