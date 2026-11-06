#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://dl.suckless.org/tools/dmenu-5.4.tar.gz
tar -xf dmenu-5.4.tar.gz
archive=$(sed -n 's/^tar -xf //p' "$0" | tail -n 1)
cd "$(tar -tf "$archive" | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
