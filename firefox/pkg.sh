#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(dbus-glib)

SOURCE_URLS=(
    "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64&lang=en-US"
)

run_download() {
    wget -nc --content-disposition $*
}

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
    COMMANDS=("${COMMANDS[@]/extract/}")
    COMMANDS=("${COMMANDS[@]/make/}")
}

after_init() {
    SOURCE_WORK_DIR="${SOURCES_DIR}"
}

run_install() {
    $SUDO mkdir -p /opt &&
    cd /opt &&
    echo "extracting..." &&
    $SUDO tar xf "${SOURCES_DIR}"/*.bz2 &&
    $SUDO ln -sf /opt/firefox/firefox /usr/bin/firefox
}
