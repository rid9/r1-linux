#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(libvorbis alsa-lib gtk+-3)

SOURCE_URLS=(
    "http://0pointer.de/lennart/projects/libcanberra/libcanberra-0.30.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--disable-oss")
}
