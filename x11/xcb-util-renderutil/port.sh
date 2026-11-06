#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

curl -LO https://xcb.freedesktop.org/dist/xcb-util-renderutil-0.3.10.tar.xz
tar -xf xcb-util-renderutil-0.3.10.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

./configure --prefix=/usr --disable-static

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
