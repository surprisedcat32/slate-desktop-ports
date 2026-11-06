
#!/bin/sh

curl -LO https://github.com/harfbuzz/harfbuzz/releases/download/14.5.0/harfbuzz-14.5.0.tar.xz
tar -xf harfbuzz-14.5.0.tar.xz
archive=$(sed -n 's/^tar -xf //p' "$0" | tail -n 1)
cd "$(tar -tf "$archive" | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

mkdir build
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

meson setup .. \
    --prefix=/usr \
    --buildtype=release \
    --wrap-mode=nofallback

ninja -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja install

