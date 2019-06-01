# IoTAccessPoint
Wi-IoT: a Wi-Fi IoT hot spot for smart cities feasibility  in developing countries

Installation
------------
```
$ cd /opt/
$ sudo git clone https://github.com/pape-barro/IoTAccessPoint.git
$ cd /opt/IoTAccessPoint/

```
find the version of raspbian and choise:
```
$ echo "deb https://repos.influxdata.com/debian jessie stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
```
OR:
```
$ echo "deb https://repos.influxdata.com/debian stretch stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
```

next:
```
$ sudo chmod 777 ./install.sh
$ sudo ./install.sh
$ influx
	> CREATE USER admin WITH PASSWORD 'dbpassword' WITH ALL PRIVILEGES
	> exit
$ influx -username admin -password dbpassword
	> CREATE DATABASE telegraf
	> CREATE RETENTION POLICY "purge" ON "telegraf" DURATION 1w REPLICATION 1 DEFAULT
	> exit
$ sudo ./graphic.sh
$ sudo ./fireup.sh
```

