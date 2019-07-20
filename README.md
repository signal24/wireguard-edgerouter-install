# edgerouter-wireguard-install

Install:
```
sudo -s
cd /config/scripts/post-config.d
curl -L -o 90-wireguard https://raw.githubusercontent.com/Signal24/edgerouter-wireguard-install/master/script.sh
chmod +x 90-wireguard
./90-wireguard stage2
```

or, one-liner:
```
sudo sh -c 'cd /config/scripts/post-config.d && curl -L -o 90-wireguard https://raw.githubusercontent.com/Signal24/edgerouter-wireguard-install/master/script.sh && chmod +x 90-wireguard && ./90-wireguard stage2'
```
