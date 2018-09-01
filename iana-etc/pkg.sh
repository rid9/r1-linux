#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "http://anduin.linuxfromscratch.org/LFS/iana-etc-2.30.tar.bz2"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
}
