#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

curl -LO https://xorg.freedesktop.org/releases/individual/lib/libXdamage-1.2.1.tar.xz
tar -xf libXdamage-1.2.1.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

./configure --prefix=/usr

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
