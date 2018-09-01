#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/bc/bc-1.07.1.tar.gz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--with-readline"
        "--mandir=/usr/share/man"
        "--infodir=/usr/share/info"
    )

cat > bc/fix-libmath_h << "EOF"
#! /bin/bash
sed -e '1   s/^/{"/' \
    -e     's/$/",/' \
    -e '2,$ s/^/"/'  \
    -e   '$ d'       \
    -i libmath.h

sed -e '$ s/$/0}/' \
    -i libmath.h
EOF

    $SUDO ln -sfv /tools/lib/libncursesw.so.6 /usr/lib/libncursesw.so.6 &&
    $SUDO ln -sfv libncurses.so.6 /usr/lib/libncurses.so &&

    sed -i -e '/flex/s/as_fn_error/: ;; # &/' configure
}
