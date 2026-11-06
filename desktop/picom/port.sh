#!/bin/sh
set -e
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

curl -LO https://github.com/yshui/picom/archive/refs/tags/v13.tar.gz
tar -xf v13.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

meson setup build \
    --prefix=/usr \
    -Ddbus=false \
    -Dopengl=false \
    -Dregex=false

ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
