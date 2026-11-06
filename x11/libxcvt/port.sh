#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://xorg.freedesktop.org/releases/individual/lib/libxcvt-0.1.3.tar.xz
tar -xf libxcvt-0.1.3.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

meson setup build --prefix=/usr

meson compile -C build -j"$MAKETHREADS"

DESTDIR="$DESTDIR" meson install -C build
