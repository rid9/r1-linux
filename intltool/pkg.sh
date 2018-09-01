#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://launchpad.net/intltool/trunk/0.51.0/+download/intltool-0.51.0.tar.gz"
)

before_configure() {
    sed -i 's:\\\${:\\\$\\{:' intltool-update.in
}
