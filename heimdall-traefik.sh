cd /
sudo mkdir heimdall-traefik
docker run -d \
  --name=heimdall-treafik \    
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -p 8097:80 \
  -p 444:443 \
  -v /heimdall-traefik:/config \
  --restart unless-stopped \
  lscr.io/linuxserver/heimdall:latest
