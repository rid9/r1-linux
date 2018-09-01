#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(fdk-aac libtheora libvorbis libvpx libx264 libx265 yasm alsa-lib libva lame libass opus openssl)

#VERSION="3.4.2"
VERSION="4.0.2"

SOURCE_URLS=(
    "https://ffmpeg.org/releases/ffmpeg-${VERSION}.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--enable-gpl"
        "--enable-version3"
        "--enable-nonfree"
        "--disable-static"
        "--enable-shared"
        "--disable-debug"
        "--enable-libfdk-aac"
        "--enable-libvpx"
        "--enable-libx264"
        "--enable-libx265"
        "--enable-libtheora"
        "--enable-libvorbis"
        "--enable-libmp3lame"
        "--enable-libass"
        "--enable-libopus"
        "--enable-openssl"
        "--docdir=/usr/share/doc/ffmpeg-${VERSION}"
    )

    if [[ "${VERSION}" == 3.* ]]; then
        CONFIGURE_FLAGS+=("--disable-ffserver")
    fi &&

    sed -i 's/-lflite"/-lflite -lasound"/' configure &&

    echo 'configuring...'
}

after_make() {
    gcc tools/qt-faststart.c -o tools/qt-faststart
}

after_install() {
    $SUDO install -v -m755 tools/qt-faststart /usr/bin
}
