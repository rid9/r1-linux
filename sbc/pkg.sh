#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.kernel.org/pub/linux/bluetooth/sbc-1.3.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--disable-static"
        "--disable-tester"
    )
}
