#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(fontconfig)

SOURCE_URLS=(
    "https://sourceforge.net/projects/dejavu/files/dejavu/2.37/dejavu-fonts-ttf-2.37.tar.bz2"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
    COMMANDS=("${COMMANDS[@]/make/}")
}

run_install() {
    $SUDO install -v -d -m755 /usr/share/fonts/dejavu &&
    $SUDO install -v -m644 ttf/*.ttf /usr/share/fonts/dejavu &&
    $SUDO install -v -d -m755 /usr/share/fontconfig/conf.avail &&
    $SUDO install -v -m644 fontconfig/*.conf /usr/share/fontconfig/conf.avail &&
    $SUDO fc-cache -v /usr/share/fonts/dejavu
}
