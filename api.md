#Feed aircraft data to the adsb.chaos-consulting.de api
* This does not only work if you build a ADS-B reciever station according to our how-to
* If you already have an instance of Dump1090 or one of its forks running you can use the shown methods to feed data to our map

## Connecting to the Chaos adsb API
* Request a Stationname and password by sending an email to us: info@chaos-consulting.de
* Place the adsb.sh file from our 'scripts' directory in a folder on your Pi. To keep it clean and tidy we create the folder adsb in /opt and place the file there.

```
cd /opt
mkdir adsb
cd adsb
sudo nano adsb.sh
```

* Make the file executable

```
sudo chmod +x adsb.sh
```
* As we do not want to execute the file manually we create a system servie, that is startet if the system boots and restartet if it crashes. Therefore we put the adsb.service file from our 'scripts' directory into /etc/systemctl/system, reload the systemctl daemon, start the service,  check the status and set it to autostart

```
systemctl daemon-reload
systemctl start adsb.service 
systemctl status adsb.service 
systemctl enable adsb.service 
```
