#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(nspr sqlite p11-kit)

SOURCE_URLS=(
    "https://archive.mozilla.org/pub/security/nss/releases/NSS_3_35_RTM/src/nss-3.35.tar.gz"
    "http://www.linuxfromscratch.org/patches/blfs/8.2/nss-3.35-standalone-1.patch"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
}

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    patch -Np1 -i "${SOURCES_DIR}/nss-3.35-standalone-1.patch"
}

run_make() {
    cd "${SOURCE_WORK_DIR}/nss" &&
    make -j1 BUILD_OPT=1 \
             NSPR_INCLUDE_DIR=/usr/include/nspr \
             USE_SYSTEM_ZLIB=1 \
             ZLIB_LIBS=-lz \
             NSS_ENABLE_WERROR=0 \
             USE_64=1 \
             NSS_USE_SYSTEM_SQLITE=1
}

run_install() {
    cd "${SOURCE_WORK_DIR}/dist" &&

    $SUDO install -v -m755 Linux*/lib/*.so              /usr/lib &&
    $SUDO install -v -m644 Linux*/lib/{*.chk,libcrmf.a} /usr/lib &&

    $SUDO install -v -m755 -d                           /usr/include/nss      &&
    $SUDO cp -v -RL {public,private}/nss/*              /usr/include/nss      &&
    $SUDO chmod -v 644                                  /usr/include/nss/*    &&

    $SUDO install -v -m755 Linux*/bin/{certutil,nss-config,pk12util} /usr/bin &&

    $SUDO install -v -m644 Linux*/lib/pkgconfig/nss.pc  /usr/lib/pkgconfig

    if [ -e /usr/lib/libp11-kit.so ]; then
        $SUDO readlink /usr/lib/libnssckbi.so ||
        $SUDO rm -v /usr/lib/libnssckbi.so    &&
        $SUDO ln -sfv ./pkcs11/p11-kit-trust.so /usr/lib/libnssckbi.so
    fi
}
