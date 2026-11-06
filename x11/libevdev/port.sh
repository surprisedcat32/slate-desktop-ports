#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://www.freedesktop.org/software/libevdev/libevdev-1.12.0.tar.xz
tar -xf libevdev-1.12.0.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

meson setup build --prefix=/usr -Ddocumentation=disabled -Dtests=disabled

meson compile -C build -j"$MAKETHREADS"

DESTDIR="$DESTDIR" meson install -C build
