#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://dl.suckless.org/tools/slstatus-1.1.tar.gz
tar -xf slstatus-1.1.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

make -j"$MAKETHREADS"
make PREFIX=/usr DESTDIR="$DESTDIR" install
