#!/bin/sh
wget https://github.com/SAKURA-YUMI/oklab/raw/main/oklab
wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
chmod +x oklab
chmod +x cloudflared-linux-amd64
nohup ./cloudflared-linux-amd64 tunnel --no-autoupdate >connect.txt 2>&1 &
sleep 40
address=$(cat connect.txt | grep trycloudflare.com | awk 'NR==2{print}' | awk -F// '{print $2}' | awk '{print $1}')
curl -o /dev/null -s -X POST "https://tg.speedu.eu.org/bot5474030728:AAF7nFGbqpRFB_ZXm3-lY0cg71RilGJWELg/sendMessage" -d "chat_id=-1001632690617&text=${address}@render"
./oklab -config=https://raw.githubusercontent.com/SAKURA-YUMI/oklab/main/oklab.josn
sleep 10
echo &address
