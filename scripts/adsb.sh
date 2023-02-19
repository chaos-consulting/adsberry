#!/bin/bash
#place this script in /opt/adsb and chmod +x it

#Edit username an password here
username='yourusernamehere';
password='yourpasswordhere';

#You can change the path to the aircraft.json here which is not needed if you followed our tutorial. If you are using an already existing setup you may need to alter this.
#path='/run/dump1090-mutability/aircraft.json'; #dump1090-mutability
path='/run/dump1090-fa/aircraft.json'; #dump1090-fa (Flightaware)

#Set to false if you do not want to transmit system info like os, software version or cpu type
sysinfo='true'
sysinfointerval=300

#No changes needed from here on
version='2.0'
sysinfolastrun=0
while true; do
	gzip -c $path | curl -s -u $username:$password -X POST -H "Content-type: application/json" -H "Content-encoding: gzip" --data-binary @- https://adsb.chaos-consulting.de/aircraftin/index.php
	if [ sysinfo=='true' ] && [ $(($(date +"%s") - $sysinfolastrun)) -ge $sysinfointerval ]
		then
		sysinfolastrun=$(date +"%s")
	echo "{\
		\"cpu\":{\
			\"model\":\"$(cat /proc/cpuinfo |grep 'model name'|tail -n 1|cut -d ':' -f 2)\",\
			\"cores\":\"$(cat /proc/cpuinfo |grep -c -e '^processor')\",\
			\"load\":\"$(cat /proc/loadavg |cut -d ' ' -f 1)\",\
			\"temp\":\"$(vcgencmd measure_temp| sed 's/[^0-9.]//g' 2>&1)\",\
			\"throttled\":\"$(vcgencmd get_throttled|cut -d '=' -f 2 2>&1)\"\
		},\
		\"memory\":{\
			\"total\":\"$(cat /proc/meminfo |grep 'MemTotal:'|cut -d ':' -f 2|awk '{$1=$1};1')\",\
			\"free\":\"$(cat /proc/meminfo |grep 'MemFree:'|cut -d ':' -f 2|awk '{$1=$1};1')\",\
			\"available\":\"$(cat /proc/meminfo |grep 'MemAvailable:'|cut -d ':' -f 2|awk '{$1=$1};1')\"\
		},\
		\"uptime\":\"$(cat /proc/uptime |cut -d ' ' -f 1)\",\
		\"os\":{\
			\"kernel\":\"$(uname -r)\"\
		},\
		\"packages\":{\
			\"c2isrepo\":\"$(cat /etc/apt/sources.list.d/*|grep -c 'https://repo.chaos-consulting.de')\",\
			\"mlat-client-c2is\":\"$(dpkg -s mlat-client-c2is|grep 'Version:'|cut -d ' ' -f 2)\",\
			\"stunnel4\":\"$(dpkg -s stunnel4|grep 'Version:'|cut -d ' ' -f 2)\",\
			\"dump1090-mutability\":\"$(dpkg -s dump1090-mutability|grep 'Version:'|cut -d ' ' -f 2)\",\
			\"dump1090-fa\":\"$(dpkg -s dump1090-fa|grep 'Version:'|cut -d ' ' -f 2)\",\
			\"ais-catcher\":\"$(dpkg -s ais-catcher 2>&1 |grep 'Version:'|cut -d ' ' -f 2)\"\
		},\
		\"feeder\":{\
			\"version\":\"$version\",\
			\"interval\":\"$sysinfointerval\"
		}\
	}"|curl -s -u $username:$password -X POST -H "Content-type: application/json" --data-binary @- https://adsb.chaos-consulting.de/sysinfo/index.php
	fi;
	sleep 1;
done;
