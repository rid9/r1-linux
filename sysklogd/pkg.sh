#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "http://www.infodrom.org/projects/sysklogd/download/sysklogd-1.5.1.tar.gz"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
}

before_make() {
    sed -i '/Error loading kernel symbols/{n;n;d}' ksym_mod.c &&
    sed -i 's/union wait/int/' syslogd.c
}

run_install() {
    $SUDO make BINDIR=/sbin install
}

after_install() {
    $SUDO bash -c "cat ${CONFIG_DIR}/syslog.conf > /etc/syslog.conf"
}
