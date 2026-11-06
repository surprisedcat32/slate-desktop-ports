#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

git clone --depth 1 https://gitlab.freedesktop.org/xorg/app/twm.git

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd $PORTS_DIR

./autogen.sh

./configure --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
