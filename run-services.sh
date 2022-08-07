#!/bin/bash
echo"what service do you want to run"
echo"1) exit script"
echo"2) docker"
echo"3) portainer"
echo"4) dash. / dashdot"
echo"5) watchtower"
echo"please type the number of the service"
read service

if [ $service = "1" ]
then
echo"exit with reboot? [y/n]?"
read reboot
        if [ $reboot = "y" ]
        then
        reboot now
        else
        exit
        fi
fi

if [ $service = "2" ]
then
curl -sSL https://get.docker.com | sh
sudo usermod -aG docker pi
fi

./
