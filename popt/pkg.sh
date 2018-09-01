#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "http://rpm5.org/files/popt/popt-1.16.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--disable-static")
}
