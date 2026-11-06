#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

git clone --depth 1 https://gitlab.freedesktop.org/libinput/libinput.git

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig
meson setup build --prefix=/usr -Dtests=false -Ddebug-gui=false

meson compile -C build -j"$MAKETHREADS"

DESTDIR="$DESTDIR" meson install -C build
