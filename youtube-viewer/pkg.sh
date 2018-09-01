#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(
    cpan-data-dump
    cpan-uri
    cpan-lwp
    cpan-lwp-protocol-https
    cpan-http-date
    cpan-http-message
    cpan-try-tiny
    cpan-encode-locale
    cpan-io
)

SOURCE_URLS=(
    "https://github.com/trizen/youtube-viewer/archive/3.3.4.tar.gz"
)

MAIN_SOURCE_DIR="youtube-viewer-3.3.4"

cmd_configure() {
    cmd_extract &&
    cd "${SOURCE_WORK_DIR}" &&

    perl Makefile.PL
}
