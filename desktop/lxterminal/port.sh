#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://downloads.sourceforge.net/lxde/lxterminal-0.4.1.tar.xz
tar -xf lxterminal-0.4.1.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./configure --prefix=/usr --sysconfdir=/etc --disable-static

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
