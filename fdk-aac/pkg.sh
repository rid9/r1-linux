#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://downloads.sourceforge.net/opencore-amr/fdk-aac-0.1.5.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--disable-static")
}
