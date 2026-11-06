#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://openbox.org/dist/openbox/openbox-3.6.1.tar.xz
tar -xf openbox-3.6.1.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig
./bootstrap

./configure     --prefix=/usr     --sysconfdir=/etc     --disable-nls

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
