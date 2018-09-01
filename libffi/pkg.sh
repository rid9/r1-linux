#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://sourceware.org/pub/libffi/libffi-3.2.1.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=("--disable-static")

    sed -e '/^includesdir/ s/$(libdir).*$/$(includedir)/' \
        -i include/Makefile.in &&

    sed -e '/^includedir/ s/=.*$/=@includedir@/' \
        -e 's/^Cflags: -I${includedir}/Cflags:/' \
        -i libffi.pc.in
}
