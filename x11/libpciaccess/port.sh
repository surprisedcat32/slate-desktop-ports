#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

git clone --depth 1 https://gitlab.freedesktop.org/xorg/lib/libpciaccess.git
cd "$(basename "$(echo "&" | sed -E 's|.*https?://[^/]+/[^/]+/([^ ]+)(.git)?$|1|' )" .git)"

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
meson setup build --prefix=/usr
meson compile -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" meson install -C build
