#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(cmake ffmpeg libvdpau libva mesa)

SOURCE_URLS=(
    "https://github.com/i-rinat/libvdpau-va-gl/archive/v0.4.0/libvdpau-va-gl-0.4.0.tar.gz"
)

before_configure() {
    BUILD_DIR="build"
}

run_configure() {
    cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr ..
}
