#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(libxml2)

SOURCE_URLS=(
    "https://wayland.freedesktop.org/releases/wayland-1.15.92.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--disable-static"
        "--disable-documentation"
    )
}
