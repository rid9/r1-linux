#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/coreutils/coreutils-8.29.tar.xz"
    "http://www.linuxfromscratch.org/patches/lfs/8.2/coreutils-8.29-i18n-1.patch"
)

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    patch -Np1 -i "${SOURCES_DIR}/coreutils-8.29-i18n-1.patch"
}

before_configure() {
    CONFIGURE_FLAGS+=(
        "--enable-no-install-program=kill,uptime"
    )
}

run_configure() {
    FORCE_UNSAFE_CONFIGURE=1 $*
}

run_make() {
    FORCE_UNSAFE_CONFIGURE=1 $*
}

after_install() {
    $SUDO mv -v /usr/bin/{cat,chgrp,chmod,chown,cp,date,dd,df,echo} /bin &&
    $SUDO mv -v /usr/bin/{false,ln,ls,mkdir,mknod,mv,pwd,rm} /bin &&
    $SUDO mv -v /usr/bin/{rmdir,stty,sync,true,uname} /bin &&
    $SUDO mv -v /usr/bin/chroot /usr/sbin &&
    $SUDO mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8 &&
    $SUDO sed -i s/\"1\"/\"8\"/1 /usr/share/man/man8/chroot.8 &&
    $SUDO mv -v /usr/bin/{head,sleep,nice} /bin
}
