#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://cairographics.org/releases/pixman-0.46.4.tar.xz
tar -xf pixman-0.46.4.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

meson setup build --prefix=/usr

meson compile -C build -j"$MAKETHREADS"

DESTDIR="$DESTDIR" meson install -C build
