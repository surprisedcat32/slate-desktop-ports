#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR
curl -LO https://xorg.freedesktop.org/releases/individual/app/xauth-1.1.tar.gz
tar -xf xauth-1.1.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR
./configure --prefix=/usr
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
