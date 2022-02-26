#!/bin/bash
#place this script in /opt/adsb and chmod +x it

#Edit username an password here
username='yourusernamehere';
password='yourpasswordhere';

#You can change the path to the aircraft.json here which is not needed if you followed our tutorial. If you are using an already existing setup you may need to alter this.
path='/run/dump1090-mutability/aircraft.json'; #dump1090-mutability
#path='/run/dump1090fa/aircraft.json'; #dump1090-fa (Flightaware)

#No changes needed from here on
while true; do
gzip -c $path | curl -s -u $username:$password -X POST -H "Content-type: application/json" -H "Content-encoding: gzip" --data-binary @- https://adsb.chaos-consulting.de/aircraftin/index.php
sleep 1;
done;
