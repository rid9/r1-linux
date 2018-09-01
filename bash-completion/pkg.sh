#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(bash)

SOURCE_URLS=(
    "https://github.com/scop/bash-completion/archive/2.8.tar.gz"
)

MAIN_SOURCE_DIR="bash-completion-2.8"

before_configure() {
    autoreconf -i
}
