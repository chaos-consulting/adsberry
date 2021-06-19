# AIS
AIS  stands for Automatic Identification System and is a technology similar to ADS-B but instead for planes it is used on Ships. If you follow the steps in this Chapter of the toutorial you will be able to eceive AIS data and feed it to the big map.

## Prerequisites
* AIS reception: While ADS-B works nearly everywhere in the World AIS is a bit different. Compared to planes all ships are "on flightlevel zero" so to speak, this is the reason why the AIS travels much shorter distances. Under optimal conditions it may travel up to 100km but think more like 20km to begin with. Due to the signals nature it is vital to be near a river or near the sea where AIS equippedships are operating.
* A Raspberry Pi is the preferred computer for this task. It can be the same Raspberry as the ADS-B pi, in fact we run some dual or triple funtion setups on a Raspberry. Du to the limited computing power a Rasperry Pi 1B, 1B+ or Pi Zero will not work in a ADS-B + AIS szenario. For AIS only it will work. A Pi 2B, Pi 3B or Pi 3B+ will work very well. While a Pi 4B is more than you need, you can use it without a problem and it is even recommended if you think of adding more features like a Raspicam, Openwebrx, APRS or the likes on top.
* A Pi with two sdr dongles will use up to 6 watts of peak power so you need a decent power supply. If you are using even more sdrs think of using pwered usb hubs in bethween as your energy consumption can gan go up to 10 watts.
* Keeping your setup cool may be an issue, look for decent cooling of your hardware to ensure stability and longevity of your setup. For Pi 4 wwe highly recommend aluminum enclosures with passive cooling finns.
* As for ADS-B a rtl_sdr dongle is needed. Look for a decent one with R820T or R820T2 Tuner with sma connector and without a bandpass filter.
* A matching antenna needet of course. Build or buy an antenna for 162MHz. The shorter the cable from pi to antenna the better.

## Software installation
We assume you followed our instructions for an ADS-B Pi with feeding and MLAT and we'll take it from there.

```
cd ~
sudo apt update && sudo apt dist-upgrade
sudo apt install git build-essential librtlsdr-dev libusb-dev
git clone https://github.com/chaos-consulting/rtl-ais
cd rtl-ais
make
sudo make install
```
