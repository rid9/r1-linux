#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.kernel.org/pub/linux/utils/util-linux/v2.31/util-linux-2.31.1.tar.xz"
)

DOC_DIR="/usr/share/doc/util-linux-2.31.1"
HWCLOCK_DIR="/var/lib/hwclock"

before_configure() {
    CONFIGURE_FLAGS+=(
        "--docdir=${DOC_DIR}"
        "--disable-chfn-chsh"
        "--disable-login"
        "--disable-nologin"
        "--disable-su"
        "--disable-setpriv"
        "--disable-runuser"
        "--disable-pylibmount"
        "--disable-static"
        "--without-python"
        "--without-systemd"
        "--without-systemdsystemunitdir"
    )
}

run_configure() {
    ${CONFIGURE} \
        ADJTIME_PATH="${HWCLOCK_DIR}/adjtime" \
        ${CONFIGURE_FLAGS[@]}
}

before_install() {
    $SUDO mkdir -pv /var/lib/hwclock
}
