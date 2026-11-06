#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://github.com/astrand/xclip/archive/0.13.tar.gz
tar -xf 0.13.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

autoreconf -fi
./configure --prefix=/usr

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install install.man
