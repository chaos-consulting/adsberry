# AIS
AIS  stands for Automatic Identification System and is a technology similar to ADS-B but instead for planes it is used on Ships. If you follow the steps in this Chapter of the toutorial you will be able to eceive AIS data and feed it to the big map.

## Prerequisites
* AIS reception: While ADS-B works nearly everywhere in the World AIS is a bit different. Compared to planes all ships are "on flightlevel zero" so to speak, this is the reason why the AIS travels much shorter distances. Under optimal conditions it may travel up to 100km but think more like 20km to begin with. Due to the signals nature it is vital to be near a river or near the sea where AIS equippedships are operating.
* A Raspberry Pi is the preferred computer for this task. It can be the same Raspberry as the ADS-B pi, in fact we run some dual or triple funtion setups on a Raspberry. Du to the limited computing power a Rasperry Pi 1B, 1B+ or Pi Zero will not work in a ADS-B + AIS szenario. For AIS only it will work. A Pi 2B, Pi 3B or Pi 3B+ will work very well. While a Pi 4B is more than you need, you can use it without a problem and it is even recommended if you think of adding more features like a Raspicam, Openwebrx, APRS or the likes on top.
* A Pi with two sdr dongles will use up to 6 watts of peak power so you need a decent power supply. If you are using even more sdrs think of using pwered usb hubs in bethween as your energy consumption can gan go up to 10 watts.
* Keeping your setup cool may be an issue, look for decent cooling of your hardware to ensure stability and longevity of your setup. For Pi 4 wwe highly recommend aluminum enclosures with passive cooling finns.
* As for ADS-B a rtl_sdr dongle is needed. Look for a decent one with R820T or R820T2 Tuner with sma connector and without a bandpass filter.
* A matching antenna needet of course. Build or buy an antenna for 162MHz. The shorter the cable from pi to antenna the better.

## Hardware preperation
You need to change the id / serial number of the rtl dongle you want to use for ais, to distinguish it reliably from the ADS-B dongle. You do not want to mix it up after a reboot, it will result in not working ADS-B and AIS

Plug your AIS dongle in a pc with no other rtl_sdr dongle connected. This can be your Raspberry Pi or every other linux computer wit rtl_sdr installed.

Set the new serial wit
```
rtl_eeprom -s 10000002
```
Now you can access your stick with the number 10000002. Beware that smaller numbers like 2 do not work.

## Software installation
We assume you followed our instructions for an ADS-B Pi with feeding and MLAT and we'll take it from there.

### Install AIScatcher (bullseye)
```
cd ~
wget https://github.com/chaos-consulting/AIS-catcher/releases/download/v0.35/ais-catcher-0.35-1-bullseye_armhf.deb
sudo dpkg -i ais-catcher-0.35-1-bullseye_armhf.deb
```

### Install AIScatcher (buster)
```
cd ~
wget https://github.com/chaos-consulting/AIS-catcher/releases/download/v0.35/ais-catcher-0.35-1-buster_armhf.deb
sudo dpkg -i ais-catcher-0.35-1-buster_armhf.deb
```

### test AIScatcher
```
$ AIS-catcher -d 10000002
Device selected: Realtek, RTL2838UHIDIR, SN: 10000002
Found Rafael Micro R820T tuner
[R82XX] PLL not locked!
Allocating 15 zero-copy buffers
!AIVDM,1,1,,A,339L0eU0010fOHbO76Cp;1ti0000,0*3B ( MSG: 3, REPEAT: 0, MMSI: 211222710)
!AIVDM,1,1,,A,139fw`P001PfOjNO7:mtur4j0<1I,0*26 ( MSG: 1, REPEAT: 0, MMSI: 211533730)
!AIVDM,1,1,,A,13=r2R000:PfKVlO6rw443Dh0<<C,0*56 ( MSG: 1, REPEAT: 0, MMSI: 215909000)
```
!AIVDM indicates, that you are getting real messages from at least one ship

### Register rtl_ais as a service
To make AIS-catcher start with your Pi we register it as a systemd service like this
```
sudo systemctl start ais-catcher@10000002.service
sudo systemctl enable ais-catcher@10000002.service
```

### Install gpsd
GPSd will convert the AIVDM messages into human readable messages.
```
sudo apt install gpsd gpsd-clients
sudo systemctl start gpsd
sudo systemctl enable gpsd
```

Edit the gpsd config in /etc/default/gpsd:
```
GPSD_OPTIONS="udp://127.0.0.1:10110"
```

### Installing the feeder
To send the data to the online map you need to install a little script to feed the data.
```
sudo mkdir -p /opt/ais
sudo wget -O /opt/ais/ais.sh https://raw.githubusercontent.com/chaos-consulting/adsberry/master/scripts/ais.sh
sudo chmod +x /opt/ais/ais.sh
```
Do not forget to edit username and password in /opt/ais/ais.sh
```
sudo nano /opt/ais/ais.sh
```
### Register ais feeder as a service
To make ais feeder start with your Pi we register it as a systemd service like so
```
sudo wget -O /etc/systemd/system/ais.service https://raw.githubusercontent.com/chaos-consulting/adsberry/master/scripts/ais.service
sudo systemctl daemon-reload
sudo systemctl start ais.service
sudo systemctl enable ais.service
```
Thats it!
