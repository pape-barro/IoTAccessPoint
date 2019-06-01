#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo systemctl restart influxdb
sudo reboot
  
