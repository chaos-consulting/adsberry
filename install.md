# Installationsanleitung
This how-to is still work in progess

## Raspian Jessie Lite installieren
* das Image von http://raspberrypi.org herunterladen
* .zip entpacken
* Image mit dd auf die SD Karte schreiben
  ```
  sudo dd bs=4M if=~/meinimage.img of=/dev/mmcblk0
  ```
* SSH aktivieren
* Booten
```
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get autoremove
sudo apt-get install iftop htop xinetd gdebi-core build-essential git cmake pkg-config bison libjson0 libjson0-dev doxygen libcap-dev debhelper librtlsdr-dev libusb-1.0-0-dev debhelper librtlsdr-dev
```

reboot

## dump1090 Kompilieren
git clone https://github.com/chaos-consulting/dump1090.git
cd dump1090
dpkg-buildpackage -b
sudo gdebi dump1090-mutability_1.15~dev_armhf.deb

## Configure dump1090
/usr/share/dump1090-mutability/html/config.js

## Connecting to the Chaos adsb API
Request a Stationname
...
Set up a system service
...

