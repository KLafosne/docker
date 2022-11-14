# 设置内网穿透ngrok
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.tgz
#解压
tar -zxvf ngrok-v3-stable-linux-amd64.tgz
# 设置 cloudflare 内网穿透 
wget https://github.com/cloudflare/cloudflared/releases/download/2022.10.3/cloudflared-linux-amd64
chmod + x cloudflared-linux-amd64
mv cloudflared-linux-amd64 cloudflared