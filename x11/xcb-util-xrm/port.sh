#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://github.com/Airblader/xcb-util-xrm/releases/download/v1.3/xcb-util-xrm-1.3.tar.bz2
tar -xf xcb-util-xrm-1.3.tar.bz2
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./configure --prefix=/usr --disable-static

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
