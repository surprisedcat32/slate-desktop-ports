#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://downloads.sourceforge.net/pcmanfm/libfm-1.3.2.tar.xz
tar -xf libfm-1.3.2.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./configure --prefix=/usr --sysconfdir=/etc --with-gtk=3 --disable-static

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
