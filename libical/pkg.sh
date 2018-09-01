#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(cmake libxml2)

SOURCE_URLS=(
    "https://github.com/libical/libical/releases/download/v3.0.1/libical-3.0.1.tar.gz"
)

before_configure() {
    BUILD_DIR="build"
}

run_configure() {
    cmake -DCMAKE_INSTALL_PREFIX=/usr \
          -DCMAKE_BUILD_TYPE=Release \
          -DSHARED_ONLY=yes \
          ..
}
