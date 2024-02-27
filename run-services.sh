#!/bin/bash
pwd=$(pwd)
ls -d */

echo "please type name of the service you want to run"
echo "type 1 to install docker"
read service

if [ "$service" = "1" ]
then
  sudo apt-get install ca-certificates curl gnupg
  sudo install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  sudo chmod a+r /etc/apt/keyrings/docker.gpg
  echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt-get update
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose uidmap

  sudo docker run hello-world

  cd /usr/bin/
  dockerd-rootless-setuptool.sh install
  
  echo "docker should be installed now."
fi

if [ "$service" = "portainer" ]
then
  docker volume create portainer_data
  docker-compse -f "$pwd/docker-be/docker-compose.yml" up -d
  echo "portainer has been deployed at localhost:9443"
fi

if [ "$service" = "dashdot" ]
then
  docker-compose -f "$pwd/dashdot/docker-compose.yml" up -d
  echo "dashdot has been deployed at localhost:3003"
fi

if [ "$service" = "watchtower" ]
then
  docker-compose -f "$pwd/watchtower/docker-compose.yml" up -d
  echo "watchtower has been deployed"
fi

if [ "$service" = "heimdall" ]
then
  docker-compose -f "$pwd/heimdall/docker-compose.yml" up -d
  echo "heimdall has been deployed at localhost:8096"
fi

if [ "$service" = "heimdall-traefik" ]
then
  docker-compose -f "$pwd/heimdall-traefik/docker-compose.yml" up -d
  echo "heimdall-traefik has been deployed at localhost:8097"
fi

if [ "$service" = "wetty" ]
then
  echo "did you change the user and ip in wetty/docker-compose.yml? [y/n]?"
  read yesorno
    if [ "$yesorno" = "y" ]
    then
      docker-compose -f "$pwd/wetty/docker-compose.yml" up -d
      echo "wetty has been deployed at localhost:3000/wetty"
    else
      echo "please change the required items"
      exit
    fi
fi

if [ "$service" = "uptime-kuma" ]
then
  docker-compose -f "$pwd/uptime-kuma/docker-compose.yml" up -d
  echo "uptime-kuma has been deployed at localhost:3001"
fi

if [ "$service" = "pi-hole" ]
then
  docker pull pihole/pihole
  systemctl stop systemd-resolved.service
  systemctl disable systemd-resolved.service 
  docker-compose -f "$pwd/pi-hole/docker-compose.yml" up -d
  echo "pi-hole has been deployed at localhost/admin/."
fi

if [ "$service" = "filebrowser" ]
then
echo "did you change the volumes in filebrowser/docker-compose.yml? [y/n]?"
  read yesorno
  if [ "$yesorno" = "y" ]
  then
    docker-compose -f "$pwd/filebrowser/docker-compose.yml" up -d
    echo"pi-hole has been deployed at localhost:4431"
  else
    eecho "please change the required items"
    exit
  fi
fi

if [ "$service" = "fressrss" ]
then
  docker-compose -f "$pwd/fressrss/docker-compose.yml" up -d
  echo "freshRSS has been deployed at localhost:808"
fi

if [ "$service" = "transmission" ]
then
echo "did you change the paths in transmission/docker-compose.yml? [y/n]?"
  read yesorno
  if [ "$yesorno" = "y" ]
  then
    docker-compose -f "$pwd/transmission/docker-compose.yml" up -d
    echo"transmission has been deployed at localhost:9091"
  else
    echo "please change the required items"
    exit
  fi
fi

if [ "$service" = "speedtesttracker" ]
then
echo "did you change the paths in speedtesttracker/docker-compose.yml? [y/n]?"
  read yesorno
  if [ "$yesorno" = "y" ]
  then
    docker-compose -f "$pwd/speedtesttracker/docker-compose.yml" up -d
    echo"speedtesttracker has been deployed at localhost:4431"
  else
    echo "please change the required items"
    exit
  fi
fi

if [ "$service" = "homeassistant" ]
then
echo "did you change the paths in homeassistant/docker-compose.yml? [y/n]?"
  read yesorno
  if [ "$yesorno" = "y" ]
  then
    docker-compose -f "$pwd/homeassistant/docker-compose.yml" up -d
    echo"homeassistant has been deployed at localhost:8123"
  else
    echo "please change the required items"
    exit
  fi
fi


if [ "$service" = "magic-mirror" ]
then
  docker-compose -f "$pwd/magic-mirror/docker-compose.yml" up -d
  echo "magic-mirror has been deployed at localhost:808"
fi

if [ "$service" = "apprise" ]
then
  docker-compose -f "$pwd/apprise/docker-compose.yml" up -d
  echo "apprise has been deployed at localhost:8766"
fi

if [ "$service" = "dozzle" ]
then
  echo "did you change username and password in /dozzle/docker-compose.yml? [y/n]?"
  read yesorno
    if [ "$yesorno" = "y" ]
    then
      docker-compose -f "$pwd/dozzle/docker-compose.yml" up -d
      echo "dozzle has been deployed at localhost:9999"
    else
      echo "please change the required items"
      exit
    fi
fi

if [ "$service" = "kasm-web" ]
then
  docker-compose -f "$pwd/kasm-web/docker-compose.yml" up -d
  echo "kasm-web-1 has been deployed at localhost:6901"
  echo "kasm-web-1 has been deployed at localhost:6902"
fi

if [ "$service" = "watch-your-lan" ]
then
  echo "did you change the ip and timezone in watch-your-lan/docker-compose.yml? [y/n]?"
  read yesorno
    if [ "$yesorno" = "y" ]
    then
      docker-compose -f "$pwd/watch-your-lan/docker-compose.yml" up -d
      echo "watch-your-lan has been deployed at localhost:8840"
    else
      echo "please change the required items"
      exit
    fi
fi

if [ "$service" = "wordpress" ]
then
  docker-compose -f "$pwd/wordpress/docker-compose.yml" up -d
  echo "wordpress has been deployed at localhost:9080"
fi

if [ "$service" = "cadvisor" ]
then
  docker-compose -f "$pwd/cadvisor/docker-compose.yml" up -d
  echo "cadvisor has been deployed at localhost:8888"
fi

if [ "$service" = "feedcord" ]
then
  echo "did you change the ip and timezone in feedcord/docker-compose.yml? [y/n]?"
  read yesorno
    if [ "$yesorno" = "y" ]
    then
      docker-compose -f "$pwd/feedcord/docker-compose.yml" up -d
      echo "feedcord has been deployed at"
    else
      echo "please change the required items"
      exit
    fi
fi
