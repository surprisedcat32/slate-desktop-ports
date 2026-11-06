#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

curl -LO https://xorg.freedesktop.org/releases/individual/lib/libSM-1.2.6.tar.xz
tar -xf libSM-1.2.6.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

./autogen.sh

./configure --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
