#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(pulseaudio cmake)

SOURCE_URLS=(
    "https://github.com/fulhax/ncpamixer/archive/1.2.tar.gz"
)

MAIN_SOURCE_DIR="ncpamixer-1.2"

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
}

run_make() {
    $* PREFIX=/usr
}
