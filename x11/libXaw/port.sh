#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

git clone --depth 1 https://gitlab.freedesktop.org/xorg/lib/libXaw.git

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./autogen.sh

./configure 
    --prefix=/usr/local 
    --enable-shared 
    --enable-static

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
