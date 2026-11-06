#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://download.gnome.org/sources/atk/2.38/atk-2.38.0.tar.xz
tar -xf atk-2.38.0.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

meson setup build \
    --prefix=/usr \
    --buildtype=release \
    -Dintrospection=disabled

ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
