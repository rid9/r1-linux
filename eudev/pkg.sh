#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://dev.gentoo.org/~blueness/eudev/eudev-3.2.5.tar.gz"
    "http://anduin.linuxfromscratch.org/LFS/udev-lfs-20171102.tar.bz2"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--bindir=/sbin"
        "--sbindir=/sbin"
        "--libdir=/usr/lib"
        "--sysconfdir=/etc"
        "--libexecdir=/lib"
        "--with-rootprefix="
        "--with-rootlibdir=/lib"
        "--enable-manpages"
        "--disable-static"
        "--config-cache"
    )

cat > config.cache << "EOF"
HAVE_BLKID=1
BLKID_LIBS="-lblkid"
BLKID_CFLAGS="-I/tools/include"
EOF
}

run_make() {
    LIBRARY_PATH=/tools/lib make
}

run_install() {
    $SUDO make LD_LIBRARY_PATH=/tools/lib install
}

after_install() {
    tar -xvf "${SOURCES_DIR}/udev-lfs-20171102.tar.bz2" &&
    $SUDO make -f udev-lfs-20171102/Makefile.lfs install &&

    LD_LIBRARY_PATH=/tools/lib $SUDO udevadm hwdb --update
}

