#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(libva)

SOURCE_URLS=(
    "https://github.com/intel/intel-vaapi-driver/releases/download/2.1.0/intel-vaapi-driver-2.1.0.tar.bz2"
)
