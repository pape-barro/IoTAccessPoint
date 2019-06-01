#!/bin/bash

sudo apt-get update
sudo apt-get upgrade
sudo apt-get install dnsmasq
sudo apt-get install hostapd
sudo systemctl stop hostapd
sudo systemctl stop dnsmasq
sudo mv /etc/dhcpcd.conf /etc/dhcpcd.conf.backup
sudo chmod 777 /opt/IoTAccessPoint/modules/
sudo chmod 777 /opt/IoTAccessPoint/html/
sudo chmod 777 /etc/
sudo chmod 777 /etc/dhcpcd.conf
sudo rm -f /etc/dhcpcd.conf
sudo cp -f ./modules/dhcpcd.conf /etc/
sudo mv /etc/dnsmasq.conf /etc/dnsmasq.conf.backup
sudo chmod 777 /etc/dnsmasq.conf
sudo rm -f /etc/dnsmasq.conf
sudo cp -f ./modules/dnsmasq.conf /etc/
sudo chmod 777 /etc/hostapd/hostapd.conf
sudo rm -f /etc/hostapd/hostapd.conf
sudo cp -f ./modules/hostapd.conf /etc/hostapd/
sudo chmod 777 /etc/default/hostapd
sudo rm -f /etc/default/hostapd
sudo cp -f ./modules/hostapd /etc/default/
sudo chmod 777 /etc/sysctl.conf
sudo rm -f /etc/sysctl.conf
sudo cp -f ./modules/sysctl.conf /etc/
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo sh -c "iptables-save > /etc/iptables.ipv4.nat"
sudo chmod 777 /etc/rc.local
sudo rm -f /etc/rc.local
sudo cp -f ./modules/rc.local /etc/
sudo apt-get install bridge-utils
sudo brctl addbr br0
sudo brctl addif br0 eth0
sudo chmod 777 /etc/network/interfaces
sudo rm -f /etc/network/interfaces
sudo cp -f ./modules/interfaces /etc/network/
sudo systemctl stop hostapd
sudo systemctl stop dnsmasq
sudo apt-get update
sudo apt-get install mosquitto mosquitto-clients
sudo apt install apt-transport-https curl
curl -sL https://repos.influxdata.com/influxdb.key | sudo apt-key add -
sudo apt-get update && sudo apt-get install telegraf
sudo chmod 777 /etc/telegraf/
sudo chmod 777 /etc/telegraf/telegraf.conf
sudo rm -f /etc/telegraf/telegraf.conf
sudo cp -f ./modules/telegraf.conf /etc/telegraf/
sudo apt-get update && sudo apt-get install influxdb
sudo chmod 777 /etc/influxdb/
sudo chmod 777 /etc/influxdb/influxdb.conf
sudo rm -f /etc/influxdb/influxdb.conf
sudo cp -f ./modules/influxdb.conf /etc/influxdb/influxdb.conf
sudo apt-get update && sudo wget https://github.com/fg2it/grafana-on-raspberry/releases/download/v4.2.0/grafana_4.2.0_armhf.deb
sudo dpkg -i grafana_4.2.0_armhf.deb
sudo systemctl enable influxdb
sudo systemctl start influxdb
sudo systemctl enable telegraf
sudo systemctl start telegraf
sudo systemctl enable grafana-server
sudo systemctl start grafana-server
sudo apt-get update

