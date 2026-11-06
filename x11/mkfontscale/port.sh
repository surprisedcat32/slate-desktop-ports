#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://xorg.freedesktop.org/releases/individual/app/mkfontscale-1.2.4.tar.xz
tar -xf mkfontscale-1.2.4.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./configure --prefix=/usr

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
