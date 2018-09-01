#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

CONFIG="x220"
VERSION="4.15.18"
BOOT_VMLINUZ_PATH="/boot/vmlinuz-${VERSION}"
BOOT_SYSTEM_MAP_PATH="/boot/System.map-${VERSION}"
BOOT_CONFIG_PATH="/boot/config-${VERSION}"

SOURCE_URLS=(
    "https://mirrors.edge.kernel.org/pub/linux/kernel/v${VERSION%%.*}.x/linux-${VERSION}.tar.xz"
)

before_run() {
    TEMP_WORK=0

    remove_default_install
    COMMANDS+=(make install install_headers uninstall_headers)

    COMMAND_HELP+=(
        ["make"]="Builds the kernel."
        ["install"]="Builds and copies the kernel to ${BOOT_VMLINUZ_PATH}."
        ["install_headers"]="Installs kernel headers."
        ["uninstall_headers"]="Uninstalls kernel headers."
    )
}

after_extract() {
    cd "${SOURCE_WORK_DIR}" &&
    make mrproper
}

set_header_snapshot() {
    SNAPSHOT_OUTPUT="${PKG_DIR}/files_headers"
}

cmd_install_headers() {
    set_header_snapshot &&
    cmd_extract &&
    cd "${SOURCE_WORK_DIR}" &&

    $SUDO make INSTALL_HDR_PATH=dest headers_install &&
    $SUDO find dest/include \( -name .install -o -name ..install.cmd \) -delete &&
    $SUDO cp -rv dest/include/* /usr/include
}

cmd_uninstall_headers() {
    set_header_snapshot &&
    cmd_uninstall
}

cmd_make() {
    cmd_extract &&
    cd "${SOURCE_WORK_DIR}" &&

    cat "${CONFIG_DIR}/${CONFIG}.config" > .config &&
    make
}

cmd_install() {
    cmd_make &&

    $SUDO cp -fv arch/x86/boot/bzImage "${BOOT_VMLINUZ_PATH}" &&
    $SUDO cp -fv System.map "${BOOT_SYSTEM_MAP_PATH}" &&
    $SUDO cp -fv .config "${BOOT_CONFIG_PATH}"
}
