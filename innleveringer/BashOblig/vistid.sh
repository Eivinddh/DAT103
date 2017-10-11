#!/bin/bash

logg=*.logg
if [[ $1 == $logg ]]; then
	read -p "Hva er hendelsen?  >" hendelse
	
	declare -i sum=0

	for line in $(grep "$hendelse" "$1" | cut -f 2);
	do
		sum=$(($sum + $line))
	done
	echo $sum	
else
	echo "Skriv inn en logg-fil"
fi
