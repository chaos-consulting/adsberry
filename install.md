# Installationsanleitung
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

## Libuecc kompilieren
```
git clone http://git.universe-factory.net/libuecc
cmake ./
make
sudo make install
sudo ldconfig
```

## Libsodium kompilieren
```
wget https://download.libsodium.org/libsodium/releases/libsodium-1.0.12.tar.gz
tar -xzf libsodium-1.0.12.tar.gz
cd libsodium-1.0.12/
./configure
make && make check
sudo make install
```

## Fastd kompilieren
```
git clone git://git.universe-factory.net/fastd
cd fastd
cmake ./ -DCMAKE_BUILD_TYPE=RELEASE
make
sudo make install
```

## Fastd konfigurieren
```
cd /etc
sudo mkdir fastd
cd fastd/
sudo mkdir adsb
cd adsb
fastd --generate-key
```

```
sudo nano secret.conf
```

```
sudo mkdir peers
cd peers
```

```
sudo nano adsb.chaos-consulting.de
```
```
cd..
sudo nano fastd.conf
```

```
sudo fastd -d -c /etc/fastd/adsb/fastd.conf
```

sudo nano /etc/rc.local
reboot

tail -f /var/log/syslog
cd /usr/lib/check_mk_agent/local/
sudo nano adsb
sudo chmod +x adsb

#dump1090
git clone https://github.com/chaos-consulting/dump1090.git
cd dump1090
dpkg-buildpackage -b
sudo gdebi dump1090-mutability_1.15~dev_armhf.deb


Reboot Cronjob
