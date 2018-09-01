#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/gperf/gperf-3.1.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--docdir=/usr/share/doc/gperf-3.1")
}
