
#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://github.com/xkbcommon/libxkbcommon/archive/refs/tags/xkbcommon-1.13.2.tar.gz
tar -xf xkbcommon-1.13.2.tar.gz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

meson setup build \
    --prefix=/usr \
    --libdir=lib \
    --buildtype=release \
    -Denable-x11=true \
    -Denable-wayland=false \
    -Denable-docs=false \
    -Denable-tools=true \
    -Denable-bash-completion=false

ninja -C build -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja -C build install

