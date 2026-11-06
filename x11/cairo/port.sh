
#!/bin/sh

curl -LO https://cairographics.org/releases/cairo-1.18.6.tar.xz
tar -xf cairo-1.18.6.tar.xz
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

mkdir build
PORTS_DIR=${PORTS_DIR:-"/usr/ports"}
cd "/$PORTS_DIR"

meson setup .. \
    --prefix=/usr \
    --buildtype=release \
    --wrap-mode=nofallback \
    -Dxlib=enabled \
    -Dxcb=enabled \
    -Dxlib-xcb=disabled \
    -Dfontconfig=enabled \
    -Dfreetype=enabled \
    -Dpng=enabled \
    -Dzlib=enabled \
    -Dglib=enabled \
    -Dtests=disabled \
    -Dgtk_doc=false \
    -Dlzo=disabled \
    -Dspectre=disabled \
    -Dsymbol-lookup=disabled

ninja -j"$MAKETHREADS"
DESTDIR="$DESTDIR" ninja install

