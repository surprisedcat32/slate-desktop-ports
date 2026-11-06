#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://dl.suckless.org/tools/slock-1.5.tar.gz
tar -xf slock-1.5.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

make -j"$MAKETHREADS"
make PREFIX=/usr DESTDIR="$DESTDIR" install
