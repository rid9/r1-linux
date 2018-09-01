#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://ftp.gnu.org/gnu/gcc/gcc-7.3.0/gcc-7.3.0.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--enable-languages=c,c++"
        "--disable-multilib"
        "--disable-bootstrap"
        "--with-system-zlib"
    )

    BUILD_DIR="build"

    case $(uname -m) in
      x86_64)
        sed -e '/m64=/s/lib64/lib/' \
            -i.orig gcc/config/i386/t-linux64
      ;;
    esac &&

    $SUDO rm -f /usr/lib/gcc
}

run_configure() {
    SED="sed" $*
}

after_install() {
    $SUDO ln -sfv ../usr/bin/cpp /lib &&

    $SUDO ln -sfv gcc /usr/bin/cc &&

    $SUDO install -v -dm755 /usr/lib/bfd-plugins &&
    $SUDO ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/7.3.0/liblto_plugin.so \
        /usr/lib/bfd-plugins/ &&

    $SUDO mkdir -pv /usr/share/gdb/auto-load/usr/lib &&
    $SUDO mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib
}
