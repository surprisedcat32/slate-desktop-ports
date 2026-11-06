
#!/bin/sh

curl -LO https://github.com/kennylevinsen/seatd/archive/0.9.3/seatd-0.9.3.tar.gz
tar -xf seatd-0.9.3.tar.gz
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
echo '#!/bin/sh

case "$1" in
    stop)
        killall seatd
        ;;
    restart)
        killall seatd
        /usr/bin/seatd -g video
        ;;
    *)
        /usr/bin/seatd -g video
        ;;
esac' > /etc/init.d/seatd

chmod +x /etc/init.d/seatd
