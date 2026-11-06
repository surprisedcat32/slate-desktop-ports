#!/bin/sh
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
git clone --depth 1 https://git.suckless.org/st
cp config.mk st/
export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
