#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(ffmpeg docutils libass)

SOURCE_URLS=(
    "https://github.com/mpv-player/mpv/archive/v0.29.0.tar.gz"
)

MAIN_SOURCE_DIR="mpv-0.29.0"

before_run() {
    TEMP_WORK=0
}

before_configure() {
    ./bootstrap.py 
}

run_configure() {
    ./waf configure ${CONFIGURE_FLAGS[@]} --enable-sdl2
}

run_make() {
    ./waf
}

run_install() {
    $SUDO ./waf install
}
