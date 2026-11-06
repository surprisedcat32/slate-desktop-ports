#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://xorg.freedesktop.org/releases/individual/data/xkeyboard-config-2.5.1.tar.gz
tar -xf xkeyboard-config-2.5.1.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
./configure --prefix=/usr
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
