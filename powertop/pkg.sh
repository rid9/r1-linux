#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(pciutils)

SOURCE_URLS=(
    "https://01.org/sites/default/files/downloads/powertop/powertop-v2.9.tar.gz"
)
