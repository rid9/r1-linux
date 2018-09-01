#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.sudo.ws/dist/sudo-1.8.22.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--libexecdir=/usr/lib"
        "--with-secure-path"
        "--with-env-editor"
        "--docdir=/usr/share/doc/sudo-1.8.22"
    )
}

run_configure() {
    $* --with-passprompt="[sudo] password for %p: "
}

before_install() {
    SUDO=""
}

after_install() {
    ln -sfv libsudo_util.so.0.0.0 /usr/lib/sudo/libsudo_util.so.0
}
