
#!/bin/sh

curl -LO https://downloads.sourceforge.net/project/libpng/libpng16/1.6.53/libpng-1.6.53.tar.xz
tar -xf libpng-1.6.53.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

./configure \
    --prefix=/usr \
    --libdir=/usr/lib \
    --disable-static

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

