#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.tortall.net/projects/yasm/releases/yasm-1.3.0.tar.gz"
)

before_configure() {
    sed -i 's#) ytasm.*#)#' Makefile.in
}
