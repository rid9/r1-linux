#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://archive.mozilla.org/pub/nspr/releases/v4.18/src/nspr-4.18.tar.gz"
)

after_extract() {
    cd "${SOURCE_WORK_DIR}/nspr" &&
    sed -ri 's#^(RELEASE_BINS =).*#\1#' pr/src/misc/Makefile.in &&
    sed -i 's#$(LIBRARY) ##' config/rules.mk
}

before_configure() {
    CONFIGURE_FLAGS+=(
        "--with-mozilla"
        "--with-pthreads"
        "--enable-64bit"
    )

    BUILD_DIR="nspr"
    CONFIGURE="./configure"
}
