#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(dbus glib libical)

SOURCE_URLS=(
    "https://www.kernel.org/pub/linux/bluetooth/bluez-5.48.tar.xz"
    "http://www.linuxfromscratch.org/patches/blfs/8.2/bluez-5.48-obexd_without_systemd-1.patch"
)

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    patch -Np1 -i "${SOURCES_DIR}/bluez-5.48-obexd_without_systemd-1.patch"
}

before_configure() {
    CONFIGURE_FLAGS+=(
        "--sysconfdir=/etc"
        "--localstatedir=/var"
        "--enable-library"
        "--disable-systemd"
    )
}

run_configure() {
    LDFLAGS="-lncurses" $*
}

after_install() {
    $SUDO ln -svf ../libexec/bluetooth/bluetoothd /usr/sbin &&

    $SUDO install -v -dm755 /etc/bluetooth &&
    $SUDO install -v -m644 src/main.conf /etc/bluetooth/main.conf
}
