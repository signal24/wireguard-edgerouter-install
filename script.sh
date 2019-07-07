#!/bin/bash

if [ -f /usr/bin/wg ]; then
    exit 0
fi

if [ "$1" != "stage2" ]; then
    sleep 120 && $0 stage2 &
    exit 0
fi

BOARD_ID=$(/usr/sbin/ubnt-hal-e getBoardIdE)
curl -f -L -o /tmp/wireguard.deb https://s24.io/explicit/er2-wireguard-${BOARD_ID} > /tmp/wireguard-download-log 2>&1

if [ $? -ne 0 ]; then
    touch /tmp/wireguard-download-failed
    exit 1
fi

DEBIAN_FRONTEND=noninteractive apt-get install /tmp/wireguard.deb > /tmp/wireguard-install-log 2>&1
if [ $? -ne 0 ]; then
    touch /tmp/wireguard-install-failed
    exit 1
fi

rm -f /tmp/wireguard.deb
rm -f /tmp/wireguard-download-log
rm -f /tmp/wireguard-install-log

exit 0
