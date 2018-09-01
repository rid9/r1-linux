#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/bash/bash-4.4.18.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--docdir=/usr/share/doc/bash-4.4.18"
        "--without-bash-malloc"
        "--with-installed-readline"
    )
}

after_install() {
    $SUDO mv -vf /usr/bin/bash /bin
}
