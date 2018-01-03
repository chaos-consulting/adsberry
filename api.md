#Feed aircraft data to the adsb.chaos-consulting.de api
* This does not only work if you build a ADS-B reciever station according to our how-to
* If you already have an instance of Dump1090 or one of its forks running you can use the shown methods to feed data to our map



## Connecting to the Chaos adsb API
Request a Stationname
...
Set up a system service
...
systemctl daemon-reload
systemctl start adsb.service 
systemctl status adsb.service 
systemctl enable adsb.service 
