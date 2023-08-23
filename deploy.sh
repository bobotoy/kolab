#!/bin/bash
wget https://github.com/SAKURA-YUMI/oklab/raw/main/oklab
chmod +x oklab
# argo
wget -N https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
chmod +x cloudflared-linux-amd64
mv cloudflared-linux-amd64 cla64
sleep 5
nohup ./cla64 tunnel --edge-ip-version auto --protocol http2 run --token eyJhIjoiNDM1YTllODI3MmU0Yzc0MTg4MTA1ZmRhMWIzYzRiMTQiLCJ0IjoiOTU3OTE2ZDctNmJlMi00ZTNiLWFhZmItMjYyYmIwMTk1YmUxIiwicyI6Ik5tUTFZMk5pWXpjdE5tTmlOUzAwT1RRNUxUa3laREV0Wm1Oak1UZ3hNamxrTW1ZNCJ9 2>/dev/null 2>&1 &
./oklab -config=https://raw.githubusercontent.com/SAKURA-YUMI/oklab/main/oklab.josn
