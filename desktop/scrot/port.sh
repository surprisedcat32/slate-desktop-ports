#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://github.com/resurrecting-open-source-projects/scrot/releases/download/2.0.0/scrot-2.0.0.tar.gz
tar -xf scrot-2.0.0.tar.gz
archive=$(sed -n 's/^tar -xf //p' "$0" | tail -n 1)
cd "$(tar -tf "$archive" | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./configure --prefix=/usr

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
