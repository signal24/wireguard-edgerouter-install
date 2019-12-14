# edgerouter-wireguard-install

Installs Wireguard on EdgeRouter, and re-installs after firmware upgrades.

Note: Currently depends on Signal24 redirection service having the appropriate URL for the latest version. Will update to automatic latest version detection from source repo at a later date.

Wireguard packages provided by https://github.com/Lochnair/vyatta-wireguard.


Install:
```
sudo -s
cd /config/scripts/post-config.d
curl -L -o 90-wireguard https://raw.githubusercontent.com/Signal24/wireguard-edgerouter-install/master/script.sh
chmod +x 90-wireguard
./90-wireguard stage2
```

or, one-liner:
```
sudo sh -c 'cd /config/scripts/post-config.d && curl -L -o 90-wireguard https://raw.githubusercontent.com/Signal24/wireguard-edgerouter-install/master/script.sh && chmod +x 90-wireguard && ./90-wireguard stage2'
```
