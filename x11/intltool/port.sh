#!/bin/sh
curl -LO https://download.gnome.org/sources/intltool/0.40/intltool-0.40.6.tar.gz
tar -xf intltool-0.40.6.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
./configure --prefix=/usr
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
