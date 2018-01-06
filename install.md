# Installation manual
This how-to is still work in progess

## Install Raspian Jessie Lite
* Download the Image from http://raspberrypi.org
* extract the zip archive
* Write the image to the sd card with dd or look for other ways on the official Raspberry site

```
  sudo dd bs=4M if=~/meinimage.img of=/dev/mmcblk0
```

* SSH activate SSH in the config file on the sd card

* Put the card into the Pi and boot it up
* Connect via ssh and change the password for security reasons first
* Install software updates and th needed software packages

```
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get autoremove
sudo apt-get install build-essential git cmake pkg-config bison libjson-c3 libjson-c-dev doxygen libcap-dev debhelper librtlsdr-dev libusb-1.0-0-dev debhelper librtlsdr-dev
```

* Reboot the Pi and connect via ssh again

## Compile and install our fork of dump1090
```
git clone https://github.com/chaos-consulting/dump1090.git
cd dump1090
dpkg-buildpackage -b
cd ..
sudo gdebi dump1090-mutability_1.15~dev_armhf.deb
```

## Configure dump1090

```
sudo nano /etc/default/dump1090-mutability
```
* Set your receiver location
```
LAT=""
LON=""
```

## Start dump1090
sudo service dump1090-mutability start

## Check the output
* Check the number of planes you receive

```
cat /run/dump1090-mutability/aircraft.json|grep -c hex
```

## Install a webserver
* This step is only needed if you want to access your Pi's map locally, it is not needed to feed to the big map on https://adsb.chaos-consulting.de
* Install Lighttpd
* this is TO DO

## Feed the data
* read on in our api doc api.md
