#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(pulseaudio gtk+-3 gtkmm-3 libsigc++ libcanberra)

SOURCE_URLS=(
    "http://freedesktop.org/software/pulseaudio/pavucontrol/pavucontrol-3.0.tar.gz"
)
