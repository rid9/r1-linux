#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/inetutils/inetutils-1.9.4.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--localstatedir=/var"
        "--disable-logger"
        "--disable-whois"
        "--disable-rcp"
        "--disable-rexec"
        "--disable-rlogin"
        "--disable-rsh"
        "--disable-servers"
    )
}

after_install() {
    $SUDO mv -v /usr/bin/{hostname,ping,ping6,traceroute} /bin &&
    $SUDO mv -v /usr/bin/ifconfig /sbin
}
