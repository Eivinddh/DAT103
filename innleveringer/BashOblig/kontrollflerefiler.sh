#!/bin/bash

for i in "$@" ; do
	( ./filkontroll.sh "60" "$i" & )
done
