#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(nettle make-ca libtasn1 p11-kit libunistring)

SOURCE_URLS=(
    "https://www.gnupg.org/ftp/gcrypt/gnutls/v3.6/gnutls-3.6.2.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        '--with-default-trust-store-pkcs11=pkcs11:'
    )
}
