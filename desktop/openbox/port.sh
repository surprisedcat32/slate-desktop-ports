#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://openbox.org/dist/openbox/openbox-3.6.1.tar.xz
tar -xf openbox-3.6.1.tar.xz
archive=$(sed -n 's/^tar -xf //p' "$0" | tail -n 1)
cd "$(tar -tf "$archive" | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
export PKG_CONFIG_PATH=/usr/lib64/pkgconfig:/usr/lib/pkgconfig:/usr/local/lib/pkgconfig:/usr/share/pkgconfig
./bootstrap

./configure     --prefix=/usr     --sysconfdir=/etc     --disable-nls

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
