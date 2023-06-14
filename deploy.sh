#!/bin/bash
wget https://github.com/SAKURA-YUMI/oklab/raw/main/oklab
chmod +x oklab
# argo
wget -N https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
chmod +x cloudflared-linux-amd64
mv cloudflared-linux-amd64 cla64
sleep 5
./cla64 tunnel --url http://localhost:8080 --no-autoupdate --protocol http2 > ogra.log 2>&1 &
sleep 10
ARGO=$(cat ogra.log | grep -oE "https://.*[a-z]+cloudflare.com" | sed "s#https://##")
#address=$(cat connect.txt | grep trycloudflare.com | awk 'NR==2{print}' | awk -F// '{print $2}' | awk '{print $1}')

cat > log << EOF
****************************************************************
host/sni：$ARGO
****************************************************************
EOF
cat log

curl -o /dev/null -s -X POST "https://tg.speedu.eu.org/bot5474030728:AAF7nFGbqpRFB_ZXm3-lY0cg71RilGJWELg/sendMessage" -d "chat_id=-1001632690617&text=${ARGO}@render"
sleep 10
./oklab -config=https://raw.githubusercontent.com/SAKURA-YUMI/oklab/main/oklab.josn
