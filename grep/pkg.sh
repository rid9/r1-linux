#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

OPT_DEPS=(pcre)

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/grep/grep-3.1.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--bindir=/bin")
}
