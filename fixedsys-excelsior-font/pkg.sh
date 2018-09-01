#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(fontconfig)

SOURCE_URLS=(
    "http://www.fixedsysexcelsior.com/fonts/FSEX300.ttf"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/extract/}")
    COMMANDS=("${COMMANDS[@]/configure/}")
    COMMANDS=("${COMMANDS[@]/make/}")
}

cmd_install() {
    cmd_download &&
    cd "${SOURCES_DIR}" &&

    $SUDO install -v -d -m755 /usr/share/fonts/fixedsys &&
    $SUDO install -v -m644 *.ttf /usr/share/fonts/fixedsys &&
    $SUDO fc-cache -v /usr/share/fonts/fixedsys
}
