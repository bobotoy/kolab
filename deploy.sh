#!/bin/bash
wget https://github.com/SAKURA-YUMI/oklab/raw/main/oklab
chmod +x oklab
# argo
wget -N https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
chmod +x cloudflared-linux-amd64
mv cloudflared-linux-amd64 cla64
sleep 5
nohup ./cla64 tunnel --edge-ip-version auto --protocol http2 run --token eyJhIjoiNDM1YTllODI3MmU0Yzc0MTg4MTA1ZmRhMWIzYzRiMTQiLCJ0IjoiMjg0NDRhNGQtMmEzNC00M2YzLTk4ZmUtNjQzYTkzZmViYzdhIiwicyI6Ik0yRmhNMlV5WkRVdE1XUTVZaTAwTjJReUxXRXlaV1l0WXpVeFpURTVPV1F5WW1RMSJ9 >/dev/null 2>&1 &
./oklab -config=https://raw.githubusercontent.com/SAKURA-YUMI/oklab/main/oklab.josn
tail -f /dev/null
