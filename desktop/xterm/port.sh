#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://invisible-mirror.net/archives/xterm/xterm-412.tgz
tar -xf xterm-412.tgz
archive=$(sed -n 's/^tar -xf //p' "$0" | tail -n 1)
cd "$(tar -tf "$archive" | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
./configure --prefix=/usr --enable-256-color --enable-load-vt-fonts --disable-imake 
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
