
#!/bin/sh
set -e

PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

curl -LO https://github.com/dillo-browser/dillo/releases/download/v3.2.0/dillo-3.2.0.tar.bz2
tar -xf dillo-3.2.0.tar.bz2
archive=$(sed -n 's/^tar -xf //p' "$0" | tail -n 1)
cd "$(tar -tf "$archive" | head -1 | cut -d/ -f1)"
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}

LIBS="-lssl -lcrypto" ./configure \
    --prefix=/usr \
    --disable-threaded-dns \
    --enable-tls \
    --enable-openssl \
    --disable-mbedtls 

make -j"$MAKETHREADS"
make DESTDIR="$DESTDIR" install

