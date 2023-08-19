#!/bin/bash
pwd=$(pwd)
echo "what service do you want to run"
echo "1) exit script"
echo "2) docker"
echo "3) portainer-be"
echo "4) dash. / dashdot"
echo "5) watchtower"
echo "6) heimdall"
echo "7) heimdall traefik"
echo "8) wetty"
echo "9) uptime-kuma"
echo "10) pi-hole"
echo "11) filebrowser"
echo "12) fresh-rss"
echo "13) transmission"
echo "14) speedtest tracker"
echo "15) HomeAssistant"
echo "16) MagicMirror"
echo "17) Apprise"
echo "18) Dozzle"
echo "19) kasm-web-1"
echo "20) kasm-web-2"
echo "21) watch-your-lan"

echo "100) ports"

echo "200) cockpit"
echo "201) github.com/Slackadays/Clipboard"

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
  dockerd-rootless-setuptool.sh install
  sudo sh -eux <<EOF
  apt-get install -y uidmap
  EOF
  sudo usermod -aG docker adm-aw
  echo "docker has been installed"
  sudo apt install docker-compose
  echo "docker compose has been installed"
fi

if [ "$service" = "3" ]
then
  docker volume create portainer_data
  docker-compse -f "$pwd/docker-be/docker-compose.yml" up -d
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

if [ "$service" = "7" ]
then
  docker-compose -f "$pwd/heimdall-traefik/docker-compose.yml" up -d
  echo "heimdall-traefik has been deployed at <server-ip>:8097"
fi

if [ "$service" = "8" ]
then
  echo "did you change the user and ip in wetty/docker-compose.yml? [y/n]?"
  read yesorno
    if [ "$yesorno" = "y" ]
    then
      docker-compose -f "$pwd/wetty/docker-compose.yml" up -d
      echo "wetty has been deployed at <server-ip>:3000/wetty"
    else
      echo "please change the required items"
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
  docker pull pihole/pihole
  systemctl stop systemd-resolved.service
  systemctl disable systemd-resolved.service 
  docker-compose -f "$pwd/pi-hole/docker-compose.yml" up -d
  echo "pi-hole has been deployed at <server-ip>/admin/."
fi

if [ "$service" = "11" ]
then
echo "did you change the volumes in filebrowser/docker-compose.yml? [y/n]?"
  read yesorno
  if [ "$yesorno" = "y" ]
  then
    docker-compose -f "$pwd/filebrowser/docker-compose.yml" up -d
    echo"pi-hole has been deployed at <server-ip>:4431"
  else
    eecho "please change the required items"
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
echo "did you change the paths in transmission/docker-compose.yml? [y/n]?"
  read yesorno
  if [ "$yesorno" = "y" ]
  then
    docker-compose -f "$pwd/transmission/docker-compose.yml" up -d
    echo"transmission has been deployed at <server-ip>:9091"
  else
    echo "please change the required items"
    exit
  fi
fi

if [ "$service" = "14" ]
then
echo "did you change the paths in speedtesttracker/docker-compose.yml? [y/n]?"
  read yesorno
  if [ "$yesorno" = "y" ]
  then
    docker-compose -f "$pwd/speedtesttracker/docker-compose.yml" up -d
    echo"speedtesttracker has been deployed at <server-ip>:4431"
  else
    echo "please change the required items"
    exit
  fi
fi

if [ "$service" = "15" ]
then
echo "did you change the paths in homeassistant/docker-compose.yml? [y/n]?"
  read yesorno
  if [ "$yesorno" = "y" ]
  then
    docker-compose -f "$pwd/homeassistant/docker-compose.yml" up -d
    echo"homeassistant has been deployed at <server-ip>:8123"
  else
    echo "please change the required items"
    exit
  fi
fi


if [ "$service" = "16" ]
then
  docker-compose -f "$pwd/magic-mirror/docker-compose.yml" up -d
  echo "magic-mirror has been deployed at <server-ip>:808"
fi

if [ "$service" = "17" ]
then
  docker-compose -f "$pwd/apprise/docker-compose.yml" up -d
  echo "apprise has been deployed at <server-ip>:8766"
fi

if [ "$service" = "18" ]
then
  echo "did you change username and password in /dozzle/docker-compose.yml? [y/n]?"
  read yesorno
    if [ "$yesorno" = "y" ]
    then
      docker-compose -f "$pwd/dozzle/docker-compose.yml" up -d
      echo "dozzle has been deployed at <server-ip>:9999"
    else
      echo "please change the required items"
      exit
    fi
fi

if [ "$service" = "19" ]
then
  docker-compose -f "$pwd/kasm-web-1/docker-compose.yml" up -d
  echo "kasm-web-1 has been deployed at <server-ip>:6901"
fi

if [ "$service" = "20" ]
then
  docker-compose -f "$pwd/kasm-web-2/docker-compose.yml" up -d
  echo "kasm-web-2 has been deployed at <server-ip>:6902"
fi

if [ "$service" = "21" ]
then
  echo "did you change the ip and timezone in watch-your-lan/docker-compose.yml? [y/n]?"
  read yesorno
    if [ "$yesorno" = "y" ]
    then
      docker-compose -f "$pwd/watch-your-lan/docker-compose.yml" up -d
      echo "watch-your-lan has been deployed at <server-ip>:8840"
    else
      echo "please change the required items"
      exit
    fi
fi

if [ "$service" = "100" ]
then
  more ports.txt
fi

if [ "$service" = "200" ]
then
  sudo apt install cockpit
  docker ps
  echo "cockpit has been deployed at <server-ip>:9090"
fi

if [ "$service" = "201" ]
then
  curl -sSL https://github.com/Slackadays/Clipboard/raw/main/install.sh | bash
  echo "github.com/Slackadays/Clipboard has been installed"
fi

./run-services.sh
