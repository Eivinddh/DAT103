#!/bin/bash
r=0

if [ -e "$2" ]; then
	exists=0
	endret=$(stat --format=%Y $2)
else
	exists=1
fi

while [ "$r" -eq 0 ] ; do
	sleep $1
	

	if [[ -e "$2" && "$exists" -eq 1 ]]; then
		echo "Filen $2 ble opprettet"
		r=1
	elif [ "$exists" -eq 0 ]; then
		if [ ! -e "$2" ]; then
			echo "Filen $2 ble slettet"
			r=1
		elif [ $(stat --format=%Y $2) -ne "$endret" ]; then
			echo "Filen $2 ble endret"
			r=1
		fi
	fi	
done
