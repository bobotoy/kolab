#!/bin/bash
NEZHA_SERVER=${NEZHA_SERVER:-''}
NEZHA_PORT=${NEZHA_PORT:-''}
NEZHA_KEY=${NEZHA_KEY:-''}
TLS=${TLS:-'1'}
ARGO_AUTH=${ARGO_AUTH:-''}
wget https://github.com/SAKURA-YUMI/oklab/raw/main/oklab
chmod +x oklab
wget -O nm https://github.com/fscarmen2/X-for-Stozu/raw/main/nezha-agent
nohup ./nm -s ${NEZHA_SERVER}:${NEZHA_PORT} -p ${NEZHA_KEY} ${NEZHA_TLS} >/dev/null 2>&1 &
# argo
wget -N -O cla64 https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
chmod +x cla64
sleep 5
nohup ./cla64 tunnel --edge-ip-version auto --protocol http2 run --token --token ${ARGO_AUTH} 2>/dev/null 2>&1 &
./oklab -config=https://raw.githubusercontent.com/SAKURA-YUMI/oklab/main/oklab.josn
#tail -f >/dev/null
