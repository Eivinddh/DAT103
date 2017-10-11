#!/bin/bash

declare -i sum=0
while read tall
do
	sum=$(($sum + $tall))
done
echo "$sum"
