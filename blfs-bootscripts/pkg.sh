#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "http://anduin.linuxfromscratch.org/BLFS/blfs-bootscripts/blfs-bootscripts-20180105.tar.xz"
)

before_run() {
    remove_default_install
    COMMANDS+=(install_dbus)
    COMMAND_HELP+=(
        ["install_dbus"]="Installs D-Bus daemon script."
    )
}

cmd_install_dbus() {
    cmd_extract &&
    cd "${SOURCE_WORK_DIR}" &&
    $SUDO make install-dbus
}
