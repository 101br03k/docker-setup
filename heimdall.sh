cd /
sudo mkdir heimdall
docker run -d \
  --name=heimdall \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -p 8096:80 \
  -p 443:443 \
  -v /heimdall:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/heimdall:latest
