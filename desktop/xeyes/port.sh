#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://www.x.org/releases/individual/app/xeyes-1.3.0.tar.xz
tar -xf xeyes-1.3.0.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
