#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(json-c openssl lvm popt)

SOURCE_URLS=(
    "https://www.kernel.org/pub/linux/utils/cryptsetup/v2.0/cryptsetup-2.0.4.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--with-crypto_backend=openssl")
}
