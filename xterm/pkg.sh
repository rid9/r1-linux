#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://invisible-mirror.net/archives/xterm/xterm-331.tgz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--with-app-defaults=/etc/X11/app-defaults"
    )

    sed -i '/v0/{n;s/new:/new:kb=^?:/}' termcap &&
    printf '\tkbs=\\177,\n' >> terminfo
}

run_configure() {
    TERMINFO=/usr/share/terminfo $*
}

after_install() {
    $SUDO make install-ti
}
