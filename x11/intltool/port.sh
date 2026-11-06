#!/bin/sh
curl -LO https://download.gnome.org/sources/intltool/0.40/intltool-0.40.6.tar.gz
tar -xf intltool-0.40.6.tar.gz
archive=$(sed -n 's/^tar -xf //p' "$0" | tail -n 1)
cd "$(tar -tf "$archive" | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
./configure --prefix=/usr
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
