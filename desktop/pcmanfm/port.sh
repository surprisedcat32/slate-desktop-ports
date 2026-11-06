#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

curl -LO https://downloads.sourceforge.net/pcmanfm/pcmanfm-1.3.2.tar.xz
tar -xf pcmanfm-1.3.2.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

./configure --prefix=/usr --sysconfdir=/etc --with-gtk=3

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
