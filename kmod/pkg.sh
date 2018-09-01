#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-25.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--bindir=/bin"
        "--sysconfdir=/etc"
        "--with-rootlibdir=/lib"
        "--with-xz"
        "--with-zlib"
    )
}

after_install() {
    for target in depmod insmod lsmod modinfo modprobe rmmod; do
      $SUDO ln -sfv ../bin/kmod /sbin/${target}
    done

    $SUDO ln -sfv kmod /bin/lsmod
}
