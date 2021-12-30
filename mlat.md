# Use MLAT to track planes not sending their position
MLAT is short for Multilateration. MLAT enables us to calculate the position of a plane when four or more mlat enabled stations are in reach.
Many smaller aircrafts are not equipped to send the position data on their own, this is where MLAT jumps in.
The MLAT client is easy to install and does not interfere with any other MLAT Client you may already have installed.
We really appreciate you installing MLAT on your ADS-B site.

## Install the mlat-client package
* Install the dependencies
* You need to optain and install the latest deb Package from [here](https://github.com/chaos-consulting/mlat-client) like shown below (keep an eye on your Raspbian release!)
* Alternatively you build it on your own and install stunnel4 and configure everything

```
sudo apt install stunnel4
wget https://github.com/chaos-consulting/mlat-client/releases/download/v0.3.2-2/mlat-client-c2is.bullseye_0.3.2-2_armhf.deb
sudo dpkg -i mlat-client-c2is.bullseye_0.3.2-2_armhf.deb
```

## Configure the mlat-client package
* Configure the mlat-client like shown below

### Username
* Enter your Stationname and api key
```
username:password
```
* Enter latitude, longitude and altitude
* Everything else can be left unchanged
* The mlat-client communicates to the mlat Server via stunnel4 which ist automagically configured via the mlat-client package

## Done
* Now your station will feed MLAT to us, you can check this by selecting a mlat plane in your area and check if your station has listed the fix type mlat
