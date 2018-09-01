#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(xcb-util)

SOURCE_URLS=(
    "https://www.freedesktop.org/software/startup-notification/releases/startup-notification-0.12.tar.gz"
)
