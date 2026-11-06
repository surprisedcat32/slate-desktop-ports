#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://www.x.org/pub/individual/lib/libXdmcp-1.1.5.tar.xz 
tar -xf libXdmcp-1.1.5.tar.xz
archive=$(sed -n 's/^tar -xf //p' "$0" | tail -n 1)
cd "$(tar -tf "$archive" | head -1 | cut -d/ -f1)"

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
./autogen.sh --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
