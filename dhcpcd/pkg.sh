#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://roy.marples.name/downloads/dhcpcd/dhcpcd-7.0.1.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS=(
        "--libexecdir=/lib/dhcpcd"
        "--dbdir=/var/lib/dhcpcd"
    )
}
