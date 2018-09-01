#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(libsndfile speex speexdsp)
OPT_DEPS=(alsa-lib dbus glib libcap speex)

SOURCE_URLS=(
    "https://www.freedesktop.org/software/pulseaudio/releases/pulseaudio-11.1.tar.xz"
    "http://www.linuxfromscratch.org/patches/blfs/8.2/pulseaudio-11.1-glibc_2.27_fix-1.patch"
)

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    patch -Np1 -i "${SOURCES_DIR}/pulseaudio-11.1-glibc_2.27_fix-1.patch" &&
    AUTOPOINT='intltoolize --automake --copy' autoreconf -fiv
}

before_configure() {
    CONFIGURE_FLAGS+=(
        "--sysconfdir=/etc"
        "--localstatedir=/var"
        "--disable-bluez4"
        "--enable-bluez5"
        "--disable-rpath"
    )
}

after_install() {
    if [ "$(grep '^pulse:' /etc/group | wc -l)" == "0" ]; then
        $SUDO groupadd pulse
    fi &&

    if [ "$(grep '^pulse:' /etc/passwd | wc -l)" == "0" ]; then
        $SUDO useradd -d /var/run/pulse -g pulse pulse
    fi &&

    $SUDO rm -fv /etc/dbus-1/system.d/pulseaudio-system.conf &&
    $SUDO sed -i '/load-module module-console-kit/s/^/#/' /etc/pulse/default.pa
}
