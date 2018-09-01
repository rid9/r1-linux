#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(make-ca libtasn1)

SOURCE_URLS=(
    "https://github.com/p11-glue/p11-kit/releases/download/0.23.9/p11-kit-0.23.9.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--sysconfdir=/etc"
        "--with-trust-paths=/etc/pki/anchors"
    )
}
