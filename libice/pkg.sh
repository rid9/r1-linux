#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.x.org/archive/individual/lib/libICE-1.0.9.tar.bz2"
)

run_configure() {
    $* ICE_LIBS=-lpthread
}
