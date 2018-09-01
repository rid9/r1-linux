#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

MAIN_SOURCE_DIR="youtube-dl"

SOURCE_URLS=(
    "https://yt-dl.org/downloads/2018.07.21/youtube-dl-2018.07.21.tar.gz"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
}

cmd_make() {
    cmd_extract &&
    cd "${SOURCE_WORK_DIR}" &&
    python3 setup.py build
}

cmd_install() {
    cmd_make &&
    $SUDO python3 setup.py install &&
    $SUDO install -v -m644 ./youtube-dl.1 /usr/share/man/man1/
}
