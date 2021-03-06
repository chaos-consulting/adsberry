# Feed aircraft data to the adsb.chaos-consulting.de api
* This does not only work if you build a ADS-B reciever station according to our how-to
* If you already have an instance of Dump1090 or one of its forks running you can use the shown methods to feed data to our map

## Connecting to the Chaos adsb API
* Request a Stationname and password by sending an email to us: info@chaos-consulting.de
* Place the adsb.sh file from our 'scripts' directory (https://github.com/chaos-consulting/adsberry) in a folder on your Pi. To keep it clean and tidy we create the folder adsb in /opt and place the file there.

```
cd /opt
sudo mkdir adsb
cd adsb
sudo wget https://raw.githubusercontent.com/chaos-consulting/adsberry/master/scripts/adsb.sh
sudo nano adsb.sh
```
* Do not forget to put in your username and password we gave to you for using the api


* Make the file executable

```
sudo chmod +x adsb.sh
```
* As we do not want to execute the file manually we create a system servie, that is startet if the system boots and restartet if it crashes. Therefore we put the adsb.service file from our 'scripts' directory into /etc/systemd/system, reload the systemctl daemon, start the service,  check the status and set it to autostart
* If you are running a different version of dump1090 you may need to change the path to your aircraft.json file in the adsb.sh script

```
sudo wget -O /etc/systemd/system/adsb.service https://raw.githubusercontent.com/chaos-consulting/adsberry/master/scripts/adsb.service
sudo systemctl daemon-reload
sudo systemctl start adsb.service 
sudo systemctl status adsb.service 
sudo systemctl enable adsb.service 
```
* Thats it!

## Take it a step further
* [If you want more, you can add MLAT to your Setup to see the positions of Planes that do not send position info](mlat.md)
