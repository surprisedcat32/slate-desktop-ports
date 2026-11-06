#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://download.gnome.org/sources/gtk/3.24/gtk-3.24.52.tar.xz
tar -xf gtk-3.24.52.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"
meson setup build \
    --prefix=/usr \
    --sysconfdir=/etc \
    --buildtype=release \
    -Dintrospection=false \
    -Dman=false \
    -Dgtk_doc=false \
    -Dwayland_backend=false \
    -Dx11_backend=true

ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install
