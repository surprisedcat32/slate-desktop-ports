#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://xorg.freedesktop.org/releases/individual/lib/libXres-1.2.3.tar.xz
tar -xf libXres-1.2.3.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./configure --prefix=/usr

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
