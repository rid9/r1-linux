#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://sourceforge.net/projects/psmisc/files/psmisc/psmisc-23.1.tar.xz"
)

after_install() {
    $SUDO mv -v /usr/bin/fuser /bin &&
    $SUDO mv -v /usr/bin/killall /bin
}
