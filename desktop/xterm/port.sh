#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://invisible-mirror.net/archives/xterm/xterm-412.tgz
tar -xf xterm-412.tgz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
./configure --prefix=/usr --enable-256-color --enable-load-vt-fonts --disable-imake 
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
