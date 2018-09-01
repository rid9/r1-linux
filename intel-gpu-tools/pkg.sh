#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(libunwind)

SOURCE_URLS=(
    "https://www.x.org/archive/individual/app/intel-gpu-tools-1.22.tar.xz"
)

before_configure() {
    CONFIGURE="./autogen.sh"
}
