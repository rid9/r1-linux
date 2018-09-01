#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://github.com/djlucas/make-ca/archive/v0.7/make-ca-0.7.tar.gz"
    "http://www.cacert.org/certs/root.crt"
    "http://www.cacert.org/certs/class3.crt"
    "https://hg.mozilla.org/releases/mozilla-release/raw-file/default/security/nss/lib/ckfw/builtins/certdata.txt"
)

before_run() {
    COMMANDS=("${COMMANDS[@]/configure/}")
    COMMANDS=("${COMMANDS[@]/make/}")
}

cmd_install() {
    cmd_extract &&
    cd "${SOURCE_WORK_DIR}" &&

    $SUDO install -vdm755 /etc/ssl/local &&

    $SUDO openssl x509 -in "${SOURCES_DIR}/root.crt" -text -fingerprint \
        -setalias "CAcert Class 1 root" \
        -addtrust serverAuth -addtrust emailProtection -addtrust codeSigning \
        > /etc/ssl/local/CAcert_Class_1_root.pem &&

    $SUDO openssl x509 -in "${SOURCES_DIR}/class3.crt" -text -fingerprint \
        -setalias "CAcert Class 3 root" \
        -addtrust serverAuth -addtrust emailProtection -addtrust codeSigning \
        > /etc/ssl/local/CAcert_Class_3_root.pem &&

    $SUDO make install &&

    $SUDO /usr/sbin/make-ca -C "${SOURCES_DIR}/certdata.txt"
}
