#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "ftp://ftp.alsa-project.org/pub/lib/alsa-lib-1.1.5.tar.bz2"
)
