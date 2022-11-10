#!/bin/bash
pwd=$(pwd)

echo "what service do you want to run"
echo "1) exit script"
echo "2) docker"
echo "3) portainer"
echo "4) dash. / dashdot"
echo "5) watchtower"
echo "6) heimdall"
echo "7) heimdall traefik"
echo "8) wetty"
echo "9) uptime-kuma"
echo "10) pi-hole"
echo "11) filebrowser"
echo "12) fresh-rss"
echo "13) "

echo "100) ports"

echo "220) cockpit"

echo "please type the number of the service you want to run"
read service

if [ "$service" = "1" ]
then
  echo "exit with reboot? [y/n]?"
read reboot
        if [ "$reboot" = "y" ]
        then
        reboot now
        else
        exit
        fi
fi

if [ "$service" = "2" ]
then
  curl -sSL https://get.docker.com | sh
  sudo usermod -aG docker pi
  echo "docker has been installed"
  sudo apt install docker-compose
  echo "docker compose has been installed"
fi

if [ "$service" = "3" ]
then
  docker volume create portainer_data
  docker run -d -p 8000:8000 -p 9443:9443 --name portainer-ce --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
  echo "portainer has been deployed at <server-ip>:9443"
fi

if [ "$service" = "4" ]
then
  docker-compose -f "$pwd/dashdot/docker-compose.yml" up -d
  echo "dashdot has been deployed at <server-ip>:3003"
fi

if [ "$service" = "5" ]
then
  docker-compose -f "$pwd/watchtower/docker-compose.yml" up -d
  echo "watchtower has been deployed"
fi

if [ "$service" = "6" ]
then
  docker-compose -f "$pwd/heimdall/docker-compose.yml" up -d
  echo "heimdall has been deployed at <server-ip>:8096"
fi

if [ "$service" = "6" ]
then
  docker-compose -f "$pwd/heimdall-traefik/docker-compose.yml" up -d
  echo "heimdall-traefik has been deployed at <server-ip>:8097"
fi

if [ "$service" = "8" ]
then
  echo "did you change the user and ip in wetty/docker-compose.yml? [y/n]?"
  read wetty
    if [ "$wetty" = "y" ]
    then
      docker-compose -f "$pwd/wetty/docker-compose.yml" up -d
      echo "wetty has been deployed at <server-ip>:3000"
    else
      echo "please change the user and ip in wetty/docker-compose.yml"
      exit
    fi
fi

if [ "$service" = "9" ]
then
  docker-compose -f "$pwd/uptime-kuma/docker-compose.yml" up -d
  echo "uptime-kuma has been deployed at <server-ip>:3001"
fi

if [ "$service" = "10" ]
then
  docker-compose -f "$pwd/pi-hole/docker-compose.yml" up -d
  echo "pi-hole has been deployed at <server-ip>/admin/."
fi

if [ "$service" = "11" ]
then
echo "did you change the volumes in filebrowser/docker-compose.yml? [y/n]?"
  read filebrowser
  if [ "$filebrowser" = "y" ]
  then
    docker-compose -f "$pwd/filebrowser/docker-compose.yml" up -d
    echo"pi-hole has been deployed at <server-ip>:4431"
  else
    echo "please change volumes in filebrowser/docker-compose.yml"
    exit
  fi
fi

if [ "$service" = "12" ]
then
  docker-compose -f "$pwd/fressrss/docker-compose.yml" up -d
  echo "freshRSS has been deployed at <server-ip>:808"
fi

if [ "$service" = "13" ]
then
  docker-compose -f "$pwd/magic-mirror/docker-compose.yml" up -d
  echo "magic-mirror has been deployed at <server-ip>:808"
fi

if [ "$service" = "220" ]
then
  sudo apt install cockpit
  docker ps
  echo "cockpit has been deployed at <server-ip>:9090"
fi

if [ "$service" = "100" ]
then
  more ports.txt
fi

./run-services.sh
