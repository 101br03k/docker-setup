#!/bin/bash
docker run --name=portainer -d -p 9000:8000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data --restart always portainer/portainer
docker ps
