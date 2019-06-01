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
sudo systemctl start hostapd
sudo systemctl start dnsmasq
