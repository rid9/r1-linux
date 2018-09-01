#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-7.6p1.tar.gz"
    "http://www.linuxfromscratch.org/patches/blfs/8.2/openssh-7.6p1-openssl-1.1.0-1.patch"
)

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    patch -Np1 -i "${SOURCES_DIR}/openssh-7.6p1-openssl-1.1.0-1.patch"
}

before_configure() {
    CONFIGURE_FLAGS+=(
        "--sysconfdir=/etc/ssh"
        "--with-md5-passwords"
        "--with-privsep-path=/var/lib/sshd"
    )
}

before_install() {
    if [ "$(grep '^sshd:' /etc/group | wc -l)" == "0" ]; then
        $SUDO groupadd -g 60 sshd
    fi &&

    if [ "$(grep '^sshd:' /etc/passwd | wc -l)" == "0" ]; then
        $SUDO useradd -c 'sshd PrivSep' -d /var/lib/sshd -g sshd -s /bin/false -u 60 sshd
    fi
}

after_install() {
    $SUDO install -v -m755    contrib/ssh-copy-id /usr/bin &&
    $SUDO install -v -m644    contrib/ssh-copy-id.1 /usr/share/man/man1 &&
    $SUDO install -v -m755 -d /usr/share/doc/openssh-7.6p1
}
