#!/bin/bash
gpspipe -w -2 -S | while read x ;
do
	if [[ $x == *"AIS"* ]]; then
		curl -s -u user:password -X POST -H "Content-Type: application/json" -d "$x" https://ais.chaos-consulting.de/shipin/index.php ;
	fi
done
