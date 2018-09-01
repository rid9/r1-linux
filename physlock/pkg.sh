#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://github.com/muennich/physlock/archive/v11.tar.gz"
)

MAIN_SOURCE_DIR="physlock-11"

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
}

run_install() {
    $SUDO make PREFIX=/usr install &&
    $SUDO install -v -m755 -d /etc/pam.d &&
    $SUDO bash -c "cat ${CONFIG_DIR}/physlock > /etc/pam.d/physlock"
}
