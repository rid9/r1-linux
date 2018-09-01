#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://dbus.freedesktop.org/releases/dbus/dbus-1.12.4.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--sysconfdir=/etc"
        "--localstatedir=/var"
        "--disable-doxygen-docs"
        "--disable-xml-docs"
        "--disable-static"
        "--docdir=/usr/share/doc/dbus-1.12.4"
        "--with-console-auth-dir=/run/console"
        "--with-system-pid-file=/run/dbus/pid"
        "--with-system-socket=/run/dbus/system_bus_socket"
    )
}

before_install() {
    if [ "$(grep '^messagebus:' /etc/group | wc -l)" == "0" ]; then
        $SUDO groupadd -g 18 messagebus
    fi &&

    if [ "$(grep '^messagebus:' /etc/passwd | wc -l)" == "0" ]; then
        $SUDO useradd -c "D-Bus Message Daemon User" -d /var/run/dbus \
                      -u 18 -g messagebus -s /bin/false messagebus
    fi
}

after_install() {
    $SUDO dbus-uuidgen --ensure
}
