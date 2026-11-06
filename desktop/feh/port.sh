#!/bin/sh

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

git clone --depth 1 https://github.com/derf/feh.git
cd "$(basename "$(echo "&" | sed -E 's|.*https?://[^/]+/[^/]+/([^ ]+)(.git)?$|1|' )" .git)"

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

make clean -j"$MAKETHREADS"

make PREFIX=/usr -j"$MAKETHREADS"

make DESTDIR="$DESTDIR" install PREFIX=/usr
