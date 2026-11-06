
#!/bin/sh

curl -LO https://i3wm.org/downloads/i3-4.25.1.tar.xz
tar -xf i3-4.25.1.tar.xz
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
    -Ddocs=false \
    -Dmans=false
ninja -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja install

