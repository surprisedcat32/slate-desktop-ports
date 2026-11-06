#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://xorg.freedesktop.org/releases/individual/font/font-misc-misc-1.1.3.tar.xz
tar -xf font-misc-misc-1.1.3.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

./configure \
    --prefix=/usr \
    --with-fontrootdir=/usr/share/fonts/X11

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
