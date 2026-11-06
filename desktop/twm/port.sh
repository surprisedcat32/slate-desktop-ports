#!/bin/sh

cd "${PORT_DIR:-/usr/ports}/desktop/twm"

git clone --depth 1 https://gitlab.freedesktop.org/xorg/app/twm.git

cd twm

./autogen.sh

./configure --prefix=/usr

make -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install
