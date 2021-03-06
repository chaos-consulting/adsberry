# Use MLAT to track planes not sending their position

## Install the mlat-client package
* You need to optain and install the latest deb Package from [here](https://github.com/chaos-consulting/mlat-client) like shown below
* Alternatively you build it on your own and install stunnel4 and configure everything

```
wget https://github.com/chaos-consulting/mlat-client/releases/download/v0.3.2-1/mlat-client_0.3.2-1_armhf.deb
dpkg -i https://github.com/chaos-consulting/mlat-client
```

## Configure the mlat-client package
* The mlat-client communicates to the mlat Server via stunnel4 which ist automagically installed as an dependency of the mlat-client package
* Configure the mlat-client like shown below

```
sudo dpkg-reconfigure mlat-client
```
