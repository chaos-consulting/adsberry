#!/bin/bash
#place this script in /opt/ais and chmod +x it

#Edit username and password here
username='user'
password='password'

#No changes needed from here on
msgs=""
gpspipe -w -2 -S | while read x ;
do
	# cache AIS-messages
	if [[ $x == *"AIS"* ]]; then
		msgs+=$(echo "$x" | tr -d '\r\n')
		msgs+=","
	fi
	# if more than 1 second elapsed and the cache is not empty and the last curl was succesful, post the cached msgs to the server
	if (( $SECONDS > 0 )) && [[ ! -z "${msgs}" ]]; then
		echo "[ ${msgs%,*} ]" | gzip | curl -s -u $username:$password -X POST -H "Content-Type: application/json" -H "Content-encoding: gzip" --data-binary @- -m 1 https://ais.chaos-consulting.de/shipin/index.php & 
		SECONDS=0
		msgs=""
	fi
done
