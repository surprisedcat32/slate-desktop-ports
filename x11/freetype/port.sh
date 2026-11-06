#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
curl -LO https://download.savannah.gnu.org/releases/freetype/freetype-2.15.0.tar.xz
tar -xf freetype-2.15.0.tar.xz
archive=$(sed -n 's/^tar -xf //p' "$0" | tail -n 1)
cd "$(tar -tf "$archive" | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

meson setup build --prefix=/usr

meson compile -C build -j"$MAKETHREADS"

DESTDIR="$DESTDIR" meson install -C build
ln -sf /usr/lib64/pkgconfig/freetype2.pc ${DESTDIR:-}/usr/lib64/pkgconfig/freetype.pc
