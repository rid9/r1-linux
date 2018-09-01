#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://www.w3.org/Tools/HTML-XML-utils/html-xml-utils-7.7.tar.gz"
)
