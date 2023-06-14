#!/bin/sh
wget https://github.com/SAKURA-YUMI/oklab/raw/main/oklab
wget https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
chmod +x oklab
chmod +x cloudflared-linux-amd64
mv cloudflared-linux-amd64 cla64
#nohup ./cloudflared-linux-amd64 tunnel --no-autoupdate >connect.txt 2>&1 &
./oklab -config=https://raw.githubusercontent.com/SAKURA-YUMI/oklab/main/oklab.josn
./cla64 tunnel --url http://localhost:8080 --no-autoupdate --edge-ip-version 4 --protocol http2 >connect.txt 2>&1 &
sleep 30
address=$(cat connect.txt | grep trycloudflare.com | awk 'NR==2{print}' | awk -F// '{print $2}' | awk '{print $1}')
curl -o /dev/null -s -X POST "https://tg.speedu.eu.org/bot5474030728:AAF7nFGbqpRFB_ZXm3-lY0cg71RilGJWELg/sendMessage" -d "chat_id=-1001632690617&text=${address}@render"
sleep 10
echo $address
./oklab -config=https://raw.githubusercontent.com/SAKURA-YUMI/oklab/main/oklab.josn
