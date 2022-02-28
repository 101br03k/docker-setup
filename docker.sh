#!/bin/bash
curl -sSL https://get.docker.com | sh
sudo usermod -aG docker pi
sudo reboot
