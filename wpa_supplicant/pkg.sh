#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(libnl)

SOURCE_URLS=(
    "https://w1.fi/releases/wpa_supplicant-2.6.tar.gz"
    "http://www.linuxfromscratch.org/patches/blfs/8.2/wpa_supplicant-2.6-upstream_fixes-1.patch"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
}

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    patch -p1 -i "${SOURCES_DIR}/wpa_supplicant-2.6-upstream_fixes-1.patch"
}

before_make() {
    cat "${CONFIG_DIR}/default.config" > wpa_supplicant/.config &&
    cd wpa_supplicant
}

run_make() {
    make BINDIR=/sbin LIBDIR=/lib
}

cmd_install() {
    cmd_make &&
    $SUDO install -v -m755 wpa_{cli,passphrase,supplicant} /sbin/ &&
    $SUDO install -v -m644 doc/docbook/wpa_supplicant.conf.5 /usr/share/man/man5/ &&
    $SUDO install -v -m644 doc/docbook/wpa_{cli,passphrase,supplicant}.8 /usr/share/man/man8/ &&

    $SUDO bash -c "cat ${CONFIG_DIR}/wpa_supplicant.conf > /etc/wpa_supplicant.conf"
}

