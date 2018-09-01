#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://s3.amazonaws.com/json-c_releases/releases/json-c-0.13.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--disable-static")
}
