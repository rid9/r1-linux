#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://github.com/Arkq/bluez-alsa/archive/v1.3.0.tar.gz"
)

MAIN_SOURCE_DIR="bluez-alsa-1.3.0"

before_configure() {
    CONFIGURE_FLAGS+=(
        "--enable-aac"
        "--enable-debug"
    )

    BUILD_DIR="build"

    autoreconf --install
}
