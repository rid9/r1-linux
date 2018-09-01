#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(yasm)
OPT_DEPS=(alsa-lib faad2)
OPT_DEPS+=(libvpx mpg123 libx264)

SOURCE_URLS=(
    "http://www.mplayerhq.hu/MPlayer/releases/MPlayer-1.3.0.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--confdir=/etc/mplayer"
        "--enable-dynamic-plugins"
    )
}
