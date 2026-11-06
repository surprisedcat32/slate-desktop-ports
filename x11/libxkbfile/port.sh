#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

curl -LO https://xorg.freedesktop.org/releases/individual/lib/libxkbfile-1.2.0.tar.xz
tar -xf libxkbfile-1.2.0.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR
meson setup build --prefix=/usr
meson compile -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" meson install -C build
