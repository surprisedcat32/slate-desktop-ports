#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

git clone --depth 1 https://gitlab.freedesktop.org/xorg/lib/libXxf86vm.git
cd "$(basename "$(echo "&" | sed -E 's|.*https?://[^/]+/[^/]+/([^ ]+)(.git)?$|1|' )" .git)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

./autogen.sh --prefix=/usr
make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install
