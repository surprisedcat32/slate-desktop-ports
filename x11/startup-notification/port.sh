#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://www.freedesktop.org/software/startup-notification/releases/startup-notification-0.12.tar.gz
tar -xf startup-notification-0.12.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./configure --prefix=/usr --disable-static

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
