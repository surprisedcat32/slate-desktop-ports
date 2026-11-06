#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

git clone --depth 1 https://gitlab.freedesktop.org/xorg/lib/libXft.git

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig
./autogen.sh

./configure --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
