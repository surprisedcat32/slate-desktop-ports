#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://xorg.freedesktop.org/releases/individual/lib/libXpm-3.5.20.tar.xz
tar -xf libXpm-3.5.20.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./autogen.sh

./configure --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
