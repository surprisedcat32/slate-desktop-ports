#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://xorg.freedesktop.org/archive/individual/proto/xcb-proto-1.17.0.tar.xz
tar -xf xcb-proto-1.17.0.tar.xz
archive=$(sed -n 's/^tar -xf //p' "$0" | tail -n 1)
cd "$(tar -tf "$archive" | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
PYTHON=python3 ./configure --prefix=/usr
make DESTDIR="$DESTDIR" install
