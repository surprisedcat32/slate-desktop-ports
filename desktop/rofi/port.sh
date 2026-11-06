#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://github.com/davatorium/rofi/releases/download/2.0.0/rofi-2.0.0.tar.xz
tar -xf rofi-2.0.0.tar.xz
archive=$(sed -n 's/^tar -xf //p' "$0" | tail -n 1)
cd "$(tar -tf "$archive" | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

meson setup build \
    --prefix=/usr \
    --buildtype=release

ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
