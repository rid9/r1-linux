#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(xcb-util xorg-server)

SOURCE_URLS=(
    "http://anduin.linuxfromscratch.org/BLFS/xf86-video-intel/xf86-video-intel-20180223.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--enable-kms-only"
        "--enable-uxa"
        "--mandir=/usr/share/man"
    )

    CONFIGURE="./autogen.sh"
}

after_install() {
    $SUDO mv -v /usr/share/man/man4/intel-virtual-output.4 \
          /usr/share/man/man1/intel-virtual-output.1 &&
    
    $SUDO sed -i '/\.TH/s/4/1/' /usr/share/man/man1/intel-virtual-output.1 &&

    $SUDO bash -c "cat ${CONFIG_DIR}/20-intel.conf >> /etc/X11/xorg.conf.d/20-intel.conf"
}
