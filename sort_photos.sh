#!/bin/bash
thisyear=$(pwd | cut -d '-' -f2)
echo $thisyear

find . -type f  -print0| while read -d '' -r file 
do 
	line=$(ls -l  "$file") 
	month=$(echo $line | cut -d ' ' -f6)
	year=$(echo $line | cut -d ' ' -f8)
#	echo "<$thisyear> <$year>"

	if [  "$thisyear" != "$year" ] 
	then
		echo mv $file "../Photos-$year/$file"
	fi
done
