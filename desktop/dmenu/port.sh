#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://dl.suckless.org/tools/dmenu-5.4.tar.gz
tar -xf dmenu-5.4.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
