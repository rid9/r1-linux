#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

DEPS=(cpan-xml-simple)

SOURCE_URLS=(
    "http://tango.freedesktop.org/releases/icon-naming-utils-0.8.90.tar.bz2"
)
