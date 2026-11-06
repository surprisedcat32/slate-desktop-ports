#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://github.com/dunst-project/dunst/archive/refs/tags/v1.13.2.tar.gz
tar -xf v1.13.2.tar.gz
archive=$(sed -n 's/^tar -xf //p' "$0" | tail -n 1)
cd "$(tar -tf "$archive" | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

meson setup build \
    --prefix=/usr \
    -Dwayland=disabled \
    -Ddocs=disabled \
    -Dtests=disabled

ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
