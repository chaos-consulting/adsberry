# Use MLAT to track planes not sending their position

## Install the mlat-client package
* Install the dependencies
* You need to optain and install the latest deb Package from [here](https://github.com/chaos-consulting/mlat-client) like shown below
* Alternatively you build it on your own and install stunnel4 and configure everything

```
sudo apt install stunnel4
wget https://github.com/chaos-consulting/mlat-client/releases/download/v0.3.2-1/mlat-client_0.3.2-1_armhf.deb
dpkg -i https://github.com/chaos-consulting/mlat-client
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
