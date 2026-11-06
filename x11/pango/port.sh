#!/bin/sh

curl -LO https://download.gnome.org/sources/pango/1.58/pango-1.58.2.tar.xz
tar -xf pango-1.58.2.tar.xz
archive=$(sed -n 's/^tar -xf //p' "$0" | tail -n 1)
cd "$(tar -tf "$archive" | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

mkdir build
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

meson setup .. \
    --prefix=/usr \
    --buildtype=release \
    --wrap-mode=nofallback \
    -Dintrospection=disabled \
    -Ddocumentation=false \
    -Dman-pages=false \
    -Dbuild-testsuite=false \
    -Dbuild-examples=false \
    -Dcairo=enabled \
    -Dfontconfig=enabled \
    -Dfreetype=enabled \
    -Dxft=enabled \
    -Dlibthai=disabled \
    -Dsysprof=disabled

ninja -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja install
