#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://github.com/evgeni/tp_smapi/archive/tp-smapi/0.43.tar.gz"
)

MAIN_SOURCE_DIR="tp_smapi-tp-smapi-0.43"
