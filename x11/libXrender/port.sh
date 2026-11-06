#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

curl -LO https://xorg.freedesktop.org/releases/individual/lib/libXrender-0.9.13.tar.xz
tar -xf libXrender-0.9.13.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

./autogen.sh

./configure --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
