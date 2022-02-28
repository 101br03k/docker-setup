#!/bin/bash
sudo docker volume create uptime-kuma
sudo docker run -d --restart=always -p 3001:3001 -v uptime-kuma:/app/data --name uptime-kuma louislam/uptime-kuma:1
docker ps
