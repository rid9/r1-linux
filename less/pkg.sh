#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "http://www.greenwoodsoftware.com/less/less-530.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--sysconfdir=/etc")
}
