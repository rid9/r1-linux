#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(make-ca)

SOURCE_URLS=(
    "https://curl.haxx.se/download/curl-7.58.0.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--disable-static"
        "--enable-threaded-resolver"
        "--with-ca-path=/etc/ssl/certs"
    )
}
