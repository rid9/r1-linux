#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "http://download.icu-project.org/files/icu4c/60.2/icu4c-60_2-src.tgz"
)

before_configure() {
    cd "source"
}
