#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://xorg.freedesktop.org/releases/individual/xserver/xorg-server-21.1.25.tar.xz
tar -xf xorg-server-21.1.25.tar.xz


PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig
rm -rf build
meson setup build   --prefix=/usr
meson configure build \
  -Dsystemd_logind=false \
  -Dsystemd_notify=false \
  -Dglamor=true

meson compile -C build -j"$MAKETHREADS"

DESTDIR="$DESTDIR" meson install -C build
