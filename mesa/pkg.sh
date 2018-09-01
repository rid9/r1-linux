#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(
    glproto dri2proto dri3proto
    xext xdamage xfixes xshmfence
    libdrm mako python2 libvdpau
)

SOURCE_URLS=(
    #"https://mesa.freedesktop.org/archive/mesa-17.3.4.tar.xz"
    "https://mesa.freedesktop.org/archive/mesa-18.0.0.tar.xz"
)

before_configure() {
    CONFIGURE_FLAGS+=(
        "--sysconfdir=/etc"
        "--enable-texture-float"
        "--enable-osmesa"
        "--enable-xa"
        "--enable-glx-tls"
        "--with-platforms=drm,x11"
        "--with-dri-drivers=i965"
        "--with-gallium-drivers=i915"
    )
}
