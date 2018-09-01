#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.kernel.org/pub/software/scm/git/git-2.16.2.tar.xz"
    "https://www.kernel.org/pub/software/scm/git/git-manpages-2.16.2.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--with-gitconfig=/etc/gitconfig")
}

after_install() {
    $SUDO tar -xf "${SOURCES_DIR}/git-manpages-2.16.2.tar.xz" \
        -C /usr/share/man --no-same-owner --no-overwrite-dir
}
