#!/bin/bash

PKG_DIR=$(realpath "${BASH_SOURCE[0]%/*}")
source "$(realpath "$PKG_DIR/..")/functions.sh"

SOURCE_URLS=(
    "https://sqlite.org/2018/sqlite-autoconf-3220000.tar.gz"
)

run_configure() {
    ./configure ${CONFIGURE_FLAGS[@]} \
        --disable-static \
        --enable-fts5 \
        CFLAGS="-g -O2 \
        -DSQLITE_ENABLE_FTS4=1 \
        -DSQLITE_ENABLE_COLUMN_METADATA=1 \
        -DSQLITE_ENABLE_UNLOCK_NOTIFY=1 \
        -DSQLITE_ENABLE_DBSTAT_VTAB=1 \
        -DSQLITE_SECURE_DELETE=1 \
        -DSQLITE_ENABLE_FTS3_TOKENIZER=1"
}
