#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://github.com/linrunner/TLP/archive/1.1.tar.gz"
)

MAIN_SOURCE_DIR="TLP-1.1"

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
}
