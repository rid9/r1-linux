#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(nss cups pango atk at-spi2-atk)

SOURCE_URLS=(
    "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
    COMMANDS=("${COMMANDS[@]/make/}")
}

before_extract() {
    SOURCE_WORK_DIR="${WORK_DIR}"
}

run_extract() {
    ar x "${SOURCES_DIR}/google-chrome-stable_current_amd64.deb"
}

run_install() {
    $SUDO mkdir -p /opt/google-chrome &&
    cd /opt/google-chrome &&
    $SUDO tar xf "${SOURCE_WORK_DIR}/data.tar.xz" &&

    $SUDO chmod -R 777 /opt/google-chrome &&
    $SUDO chmod 4755 /opt/google-chrome/opt/google/chrome/chrome-sandbox &&

    $SUDO ln -sf /opt/google-chrome/opt/google/chrome/google-chrome /usr/bin
}
