#!/bin/bash
#Helper setting coordinates in services and restarting them if neccessary
#May be useful in a mobile ADS-B setup equipped with a gpsd compatible gps unit
#You need to think of a way to execute this script, maybe via cronjob?

mlatConfig='/etc/default/mlat-client-c2is';
mlatService='mlat-client-c2is';
dump1090Config='/etc/default/dump1090-mutability';
dump1090Service='dump1090-mutability';

#acquire gps data
s=$(gpspipe -w -n 10|grep -m 1 lat);
gpsLat=$(echo $s|jq '.lat');
gpsLon=$(echo $s|jq '.lon');

#acquire mlat client data
dump1090Lat=$(cat $dump1090Config |grep LAT|cut -d '"' -f 2);
dump1090Lon=$(cat $dump1090Config |grep LON|cut -d '"' -f 2);

if [ $gpsLat != $dump1090Lat ] || [ $gpsLon != $dump1090Lon ]
        then
		sed -i "s/$dump1090Lat/$gpsLat/g" $dump1090Config;
		sed -i "s/$dump1090Lon/$gpsLon/g" $dump1090Config;
		service $dump1090Service restart;
fi;

#acquire mlat client data
mlatLat=$(cat $mlatConfig |grep LAT|cut -d '"' -f 2);
mlatLon=$(cat $mlatConfig |grep LON|cut -d '"' -f 2);

if [ $gpsLat != $mlatLat ] || [ $gpsLon != $mlatLon ]
        then
		sed -i "s/$mlatLat/$gpsLat/g" $mlatConfig;
		sed -i "s/$mlatLon/$gpsLon/g" $mlatConfig;
		service $mlatService restart;
fi;
