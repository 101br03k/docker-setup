#!/bin/bash
echo"what service do you want to run"
echo"1) exit script"
echo"2) docker"
echo"3) portainer"
echo"4) dash. / dashdot"
echo"5) watchtower"
echo"6) heimdall"
echo"7) heimdall traefik"
echo"8) wetty"
echo"9) uptime-kuma"

echo"15) cockpit"

echo"please type the number of the service you want to run"
read service

if [ "$service" = "1" ]
then
  echo"exit with reboot? [y/n]?"
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
  echo"docker has been installed"
fi

if [ "$service" = "3" ]
then
  docker volume create portainer_data
  docker run -d -p 8000:8000 -p 9443:9443 --name portainer-ce --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
  echo"portainer has been deployed on port 9443 of your ip"
fi

if [ "$service" = "4" ]
then
  cd dashdot || exit
  docker-compose up -d
  echo"dashdot has been deployed on port 3003 of your ip"
fi

if [ "$service" = "5" ]
then
  cd watchtower || exit
  docker-compose up -d
  cd ..
  echo"watchtower has been deployed"
fi

if [ "$service" = "6" ]
then
  cd heimdall || exit
  sudo mkdir /heimdall
  docker-compose up -d
  cd ..
  echo"heimdall has been deployed on port 8096 of your ip"
fi

if [ "$service" = "6" ]
then
  cd heimdall-traefik || exit
  sudo mkdir /heimdall-traefik
  docker-compose up -d
  cd ..
  echo"heimdall-traefik has been deployed on port 8097 of your ip"
fi

if [ "$service" = "8" ]
then
  echo"did you change the user and ip in wetty/docker-compose.yml? [y/n]?"
  read wetty
    if [ "$wetty" = "y" ]
    then
      cd wetty || exit
      docker-compose up -d
      cd ..
      echo"wetty has been deployed on port 3000 of your ip"
    else
      echo"please change the user and ip in wetty/docker-compose.yml"
      exit
    fi
fi

if [ "$service" = "9" ]
then
  cd uptime-kuma || exit
  docker-compose up -d
  cd ..
  echo"uptime-kuma has been deployed on port 3001 of your ip"
fi





if [ "$service" = "15" ]
then
  sudo apt install cockpit
  docker ps
  echo "cockpit has been deployed on port 9090 of your ip"
fi

./run-services.sh
