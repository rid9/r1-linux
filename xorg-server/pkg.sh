#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(pixman libepoxy)

SOURCE_URLS=(
    "https://www.x.org/pub/individual/xserver/xorg-server-1.19.6.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--enable-xwayland"
        #"--enable-glamor"
        "--disable-glamor"
        "--enable-install-setuid"
        "--enable-suid-wrapper"
        "--disable-systemd-logind"
        "--with-xkb-output=/var/lib/xkb"
    )
}

after_install() {
    $SUDO mkdir -pv /etc/X11/xorg.conf.d
}
