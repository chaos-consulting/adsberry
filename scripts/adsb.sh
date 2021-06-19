#!/bin/bash
#place this script in /opt/adsb and chmod +x it
#Edit username an password here
username='yourusernamehere';
password='yourpasswordhere';
#No changes needed from here on
while true; do
curl -s -u $username:$password -X POST -H "Content-type: application/json" -d @/run/dump1090-mutability/aircraft.json https://adsb.chaos-consulting.de/aircraftin/index.php
sleep 1;
done;
