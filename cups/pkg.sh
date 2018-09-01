#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(gnutls)

SOURCE_URLS=(
    "https://github.com/apple/cups/releases/download/v2.2.6/cups-2.2.6-source.tar.gz"
)

MAIN_SOURCE_DIR="cups-2.2.6"

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    sed -i 's:444:644:' Makedefs.in &&
    sed -i '/MAN.EXT/s:.gz::' configure config-scripts/cups-manpages.m4
}

before_configure() {
    CONFIGURE_FLAGS+=(
		"--libdir=/usr/lib"
        "--disable-systemd"
        "--with-rcdir=/tmp/cupsinit"
        "--with-system-groups=lpadmin"
        "--with-docdir=/usr/share/cups/doc-2.2.6"
    )

    aclocal  -I config-scripts &&
    autoconf -I config-scripts
}

run_configure() {
    CC=gcc $*
}

before_install() {
    if [ "$(grep '^lp:' /etc/passwd | wc -l)" == "0" ]; then
        $SUDO useradd -c "Print Service User" -d /var/spool/cups -g lp -s /bin/false -u 9 lp
    fi &&

    if [ "$(grep '^lpadmin:' /etc/group | wc -l)" == "0" ]; then
        $SUDO groupadd -g 19 lpadmin
    fi
}

after_install() {
    $SUDO rm -rf /tmp/cupsinit &&
    $SUDO ln -svnf ../cups/doc-2.2.6 /usr/share/doc/cups-2.2.6 &&

    $SUDO install -d -m755 /etc/cups &&
    $SUDO bash -c 'echo "ServerName /var/run/cups/cups.sock" > /etc/cups/client.conf'
}
