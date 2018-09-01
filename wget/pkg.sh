#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(make-ca libidn openssl)
OPT_DEPS=(pcre)

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/wget/wget-1.19.4.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--sysconfdir=/etc"
        "--with-ssl=openssl"
    )
}
