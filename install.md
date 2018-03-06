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
sudo dpkg -i dump1090-mutability_1.15~dev_armhf.deb
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
* It is very likely that it wont work, in this case you need to check the log

```
tail -f /var/log/dump1090-mutability.log
```
* If you run into the following error message
```
Please fix the device permissions, e.g. by installing the udev rules file rtl-sdr.rules
```
* You need to create a udev rule file for your particular rtl-sdr dongle
* To do this check the vendor id and product id of your usb dongle
```
lsusb
```
* It will give you a list of all the USB Devices connected similar to the following one
```
Bus 001 Device 004: ID 0bda:2838 Realtek Semiconductor Corp. RTL2838 DVB-T
Bus 001 Device 003: ID 0424:ec00 Standard Microsystems Corp. SMSC9512/9514 Fast Ethernet Adapter
Bus 001 Device 002: ID 0424:9514 Standard Microsystems Corp. SMC9514 Hub
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
```
* The vendor id in this case is 0bda and the product id is 2838
* Now create a rule file
```
sudo nano /etc/udev/rules.d/rtl-sdr.rules
```
* And put the following in it
```
SUBSYSTEM=="usb", ATTRS{idVendor}=="0bda", ATTRS{idProduct}=="2838",  MODE="0666"
```
* Dont forget to change the vendor and product id to the ones matching your sdr dongle
* now reboot and check again if you see a number of Planes and if not check the logfile again


## Install a webserver
* This step is only needed if you want to access your Pi's map locally, it is not needed to feed to the big map on https://adsb.chaos-consulting.de
* Install Lighttpd
* this is TO DO

## Feed the data
* read on in our api doc api.md
