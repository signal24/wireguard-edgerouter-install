#!/bin/bash

if [ -f /usr/bin/wg ]; then
    exit 0
fi

BOARD_ID=$(/usr/sbin/ubnt-hal-e getBoardIdE)
curl -f -L -o /tmp/wireguard.deb https://s24.io/explicit/er2-wireguard-${BOARD_ID}

if [ $? -ne 0 ]; then
    touch /tmp/wireguard-download-failed
    exit 1
fi

dpkg -i /tmp/wireguard.deb
if [ $? -ne 0 ]; then
    touch /tmp/wireguard-install-failed
    exit 1
fi

rm -f /tmp/wireguard.deb
exit 0
